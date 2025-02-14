function init_git_in_jj
    # Ignore the .jj directory in Git
    echo '/*' > .jj/.gitignore
    # Move the Git repo
    mv .jj/repo/store/git .git
    # Tell jj where to find it
    echo -n '../../../.git' > .jj/repo/store/git_target
    # Make the Git repository non-bare and set HEAD
    git config --unset core.bare
    # Convince jj to update .git/HEAD to point to the working-copy commit's parent
    jj new && jj undo
end
# CS 190 Problem Set #1&mdash;Drawing a 15-Digit Display

Course Home Page: http://physics.stmarys-ca.edu/classes/CS190_S16/index.html

Due: Before class, Tuesday, February 16th, 2016.

## Directions Specific to this Problem Set

1. The first step is to get a working copy of this repository. This breaks down into two smaller steps: forking and then cloning the repository. If your browser is pointed at https://github.com/brianhill/cs190-ps1, and you are logged in using your github account, you will see a fork button near the upper-right-hand corner of the web page. Just click it to create your fork. Then, to create the clone, open a shell (using the app called Terminal.app). If you have never worked in a shell, don't worry, below are the commands step by step. The stuff you type is the stuff following each $ sign:

    ```
    ~$ mkdir ~/Classwork
    ~$ cd ~/Classwork
    ~/Classwork$ git clone https://github.com/<your_github_username_goes_here>/cs190-ps1
    Cloning into 'cs190-ps1'...
    remote: Counting objects: 10, done.
    remote: Compressing objects: 100% (8/8), done.
    remote: Total 10 (delta 2), reused 10 (delta 2), pack-reused 0
    Unpacking objects: 100% (10/10), done.
    Checking connectivity... done.
    ~/Classwork$ cd cs190-ps1/
    ~/Classwork/cs190-ps1 $ open *.xcodeproj
    ```

The Xcode app will launch and you'll use Xcode to do the next three steps.
2. Fix the view constraints.
3. Divide up the view into 15 parts and loop so that a digit is drawn in each part.
4. Whatever.
5. Commit your changes to your fork of the repository. You are going to use the shell again. There are three smallish steps to getting your changes committed. First, you need to "add" the changes you made in Xcode to the local repository. This makes your local repository aware of the changes. Once all the changes have been added, then you commit the changes. Finally you "push" the changes to your fork on GitHub. Below are the commands step by step. The stuff you type is the stuff following each $ sign:

    ```
    ~$ cd ~/Classwork/cs190-ps1
    ~/Classwork/cs190-ps1$ git status
    On branch master
    Your branch is up-to-date with 'origin/master'.
    Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)
    
    	modified:   README.md
    
    no changes added to commit (use "git add" and/or "git commit -a")
    ~/Classwork/cs190-ps1 $ git add README.md
    ~/Classwork/cs190-ps1$ git status
    On branch master
    Your branch is up-to-date with 'origin/master'.
    nothing to commit, working directory clean
    ~/Classwork/cs190-ps1$ git commit -m 
    [master 7a4d647] BBBB "My solution to Problem Set #1."
    Committer: Brian Hill <brian@torch.gateway.sonic.net>
    1 file changed, 1 insertion(+), 1 deletion(-)
    ~/Classwork/cs190-ps1$ git push origin master
    Counting objects: 3, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (3/3), done.
    Writing objects: 100% (3/3), 310 bytes | 0 bytes/s, done.
    Total 3 (delta 1), reused 0 (delta 0)
    To https://github.com/brh3/cs190-ps1
    96f4dda..7a4d647  master -> master
    ~/Classwork/cs190-ps1$ cd ~
    ~/Classwork$ rm -rf Classwork 
    ```

Note that on the last line, I have boldly gone ahead and deleted the directory I did all the work in. There is no reason to keep it around once the changes have been successfully pushed to GitHub.

## General Directions for all Problem Sets

1. Fork this repository to create a repository in your own Github account. Then clone your fork to whatever machine you are working on. More detailed directions on this step and the last step are given above.
2. These problem sets are created with the latest version of Xcode and Mac OS X: XCode 7.2 and OS X 10.11.3. Do not run beta versions of Apple's software. During the term, we may move to XCode 7.3, depending on Apple's release schedule.
3. Under no circumstances copy-and-paste any part of a solution from another student in the class. Under no circumstances ask outsiders on Stack Exchange or other programmers' forums to help you create a solution.
4. It is however fine&mdash;especially when you are truly stuck&mdash;to ask others to help you with your solution, provided you do all the typing. They should only be looking over your shoulder and commenting. This time-honored way of sharing coding techniques is called pair-programming.
5. Commit your changes to your fork of the repository. I should be able to make a clone of your fork, and then build and execute it in my environment without modification.

_The contents of this repository is licensed under the_ [Creative Commons Attribution-ShareAlike License](http://creativecommons.org/licenses/by-sa/3.0/).


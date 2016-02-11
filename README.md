# CS 190 Problem Set #1&mdash;Drawing a 15-Digit Display

Course Home Page: http://physics.stmarys-ca.edu/classes/CS190_S16/index.html.

My St. Mary's Home Page: http://physics.stmarys-ca.edu/lecturers/brianrhill/index.html.

Due: Before class, Tuesday, February 16th, 2016. I should be able to make a clone of your fork, and then build and execute it in my environment without modification.

## Reading that Might be Helpful for this Problem Set

* iOS Technology (View Constraints):
 * https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/AutolayoutPG/AnatomyofaConstraint.html.
 * https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithConstraintsinInterfaceBuidler.html (sic).
* Engineering Practices (version control with git and GitHub)
 * https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository (basics of git)
 * https://guides.github.com/activities/hello-world/ (basics of GitHub)
 * http://schacon.github.io/gitbook/1_the_git_object_model.html (Advanced&mdash;Git Internals&mdash;SHAs)
* Computer Science (Basic features of the Swift language):
 * https://itunes.apple.com/us/book/the-swift-programming-language/id881256329 &mdash; start with the Chapter titled "Language Guide" and stop once you get to the Section titled "Functions". However, the first of my two Swift cheat sheets (see next link) covers this material.
* https://github.com/brianhill/swift-cheat-sheets &mdash; work through the first of the two Swift playgrounds

## Directions Specific to this Problem Set

1. (3 pts) The first step is to get a working copy of this repository. This breaks down into two smaller steps: forking and then cloning the repository. If you are logged in using your github account, you will see a fork button near the upper-right-hand corner of the web page. Just click it to create your fork. Your fork is your copy of the repo in GitHub's cloud. Then, to create a clone on your machine, open a shell (using the app called Terminal.app). If you have never worked in a shell, don't worry, below are the commands step by step. The stuff you type is the stuff following each $ sign:

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
    ~/Classwork/cs190-ps1 $ open Counter.xcodeproj
    ```

    An alternative to the git clone command above that uses ssh instead of https as the protocol for communicating with GitHub is:

    ```
    ~/Classwork$ git clone git@github.com:<your_github_username_goes_here>/cs190-ps1.git
    ```

    I didn't put the alternative in these cookbook directions even though I use it because it might require you to&mdash;on a one-time basis&mdash;set up ssh keys (which is a pain if you are using shared machines).

2. (2 pts) If Step 1 went ok, it finished by opening Counter.xcodeproj in Xcode. The open command does the exact same thing as would happen if you double-clicked on Counter.xcodeproj in the Finder. Execute the program by clicking on the execute arrow near the top of the Xcode window. The app's display is supposed to display the digit 8, but it doesn't. It's pretty hashed up because I have deliberately left a bug in the function called drawSegment. Go to the implementation of drawSegment in Display.swift and find and fix the bug.

3. (2 pts) In Main.storyboard, the display is represented by a black view that is carelessly placed in the screen. Create the following four constraints that nestle the view nicely across the top of the screen:
 * Leading space to container margin = 0.
 * Trailing space to container margin = 0.
 * Vertical space to top layout guide = 0.
 * Aspect ratio width:height = 165:20.

4. (3 pts) The implementation of drawRect is incomplete. It needs a loop that will draw the 15 seven-segment components (SSCs). Go to the implementation of drawRect in Display.swift, read the comments I left there, and complete the implementation.

5. To wrap up, as you did in Step 1, you are going to use the shell again. There are three smallish steps to getting your changes committed. First, you need to "add" the changes you made in Xcode to the local repository. This just makes your local repository aware of the changes. Once all the changes have been added, then you commit the changes. They are still only in your local repository. Finally you "push" the changes to your fork on GitHub. Below are the commands step by step. In the very last step, I boldly delete the working directory on the local machine. Make sure your changes actually got back to GitHub before you do that! The stuff you type in the shell is the stuff following each $ sign:

    ```
    ~$ cd ~/Classwork/cs190-ps1
    ~/Classwork/cs190-ps1$ git status
    On branch master
    Your branch is up-to-date with 'origin/master'.
    Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)
    
        modified:   Counter/Base.lproj/Main.storyboard
        modified:   Counter/Display.swift

    no changes added to commit (use "git add" and/or "git commit -a")
    ~/Classwork/cs190-ps1 $ git add Counter/Base.lproj/Main.storyboard
    ~/Classwork/cs190-ps1 $ git add Counter/Display.swift
    ~/Classwork/cs190-ps1$ git status
    On branch master
    Your branch is up-to-date with 'origin/master'.
    nothing to commit, working directory clean
    ~/Classwork/cs190-ps1$ git commit -m "My solution to Problem Set #1."
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
    ~/Classwork/cs190-ps1$ cd ..
    ~/Classwork$ rm -rf cs190-ps1 
    ```

## General Directions for all Problem Sets

1. Fork this repository to create a repository in your own Github account. Then clone your fork to whatever machine you are working on. More detailed directions for this step were given above.

2. These problem sets are created with the latest version of Xcode and Mac OS X: XCode 7.2.1 and OS X 10.11.3. Do not run beta versions of Apple's software. During the term, we will probably move to Xcode 7.3, depending on Apple's release schedule. Currently Xcode 7.3 is in beta.

3. Under no circumstances copy-and-paste any part of a solution from another student in the class. Also, under no circumstances ask outsiders on Stack Exchange or other programmers' forums to help you create a solution. It is however fine&mdash;especially when you are truly stuck&mdash;to ask others to help you with your solution, provided you do all of the typing. They should only be looking over your shoulder and commenting.

4. Your solution should be clean and exhibit good style. At minimum, Xcode should not flag warnings of any kind. The style should match Apple's as shown by their examples and declarations. Use the same indentation and spacing around operators as Apple uses. Use their capitalization conventions. Use parts of speech and grammatical number the same way as Apple does.  Use descriptive names for variables, not acronyms or abbreviations. In the Xcode preferences pane, set a page guide at Column 120 and don't exceed it.

5. When completed, and before the time the problem set is due, commit your changes to your fork of the repository. More detailed directions for this step were also given above. I should be able to simply clone your fork, build it and execute it in my environment without encountering any warnings, adding any dependencies or making any modifications.

###### _The contents of this repository are licensed under the_ [Creative Commons Attribution-ShareAlike License](http://creativecommons.org/licenses/by-sa/3.0/).

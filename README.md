# MBAN_BAIT507

Repository for BAIT Lectures and course notes.

## Using this Repository

I strongly recommend that you get used to using `git` and [GitHub](http://github.com).  Managing your group project with GitHub would be a great way to start learning the core elements of collaborative coding, it gives me an easy way to help you check your code, and it provides an opportunity for you to begin to develop an online portfolio.

GitHub provides [a desktop application](https://desktop.github.com/) if you are using Windows or MacOS.  You can also [use commandline tools](https://git-scm.com/).

### Good git Tutorials

* GitHub [Git Handbook](https://guides.github.com/introduction/git-handbook/)
* [Happy Git and GitHub for the useR](https://happygitwithr.com/)

### Cloning the Repository

When you have added GitHub/git to your computer you can do something called cloning.  This creates a copy of the repository (online folder) onto your computer.

With `git` (and, by extension, GitHub), that folder is linked to the online repository.  That way, if I make changes online you can `pull` them down to your local repository.

**However**, it may be the case that the changes you have made, and that I have made `conflict`.  In this case there are ways of resolving the conflicts by merging the two files.

## Lecture Notes

Lectures are written as markdown (`.md`) files, and are intended to be run using [`reveal-md`](https://github.com/webpro/reveal-md), a [`node.js`](https://nodejs.org/en/) application.

### About Node

Node is a widely used platform within the web development world, and it uses the `npm` package management system.  Node is an alternate tool that allows developers to quickly create programs for distribution, and, since JavaScript is a cross-platform programming language, it allows them to distribute their programs to all users, regardless of operating system.

### About `reveal.js`

[`reveal.js`](https://revealjs.com/#/) is a presentation framework designed for webpages or web delivery. Documents can be written using HTML, or you can use applications like `reveal-md` to convert documents from markdown to HTML.

To render the files into HTML, or have them open in your browser:

1. Download the appropriate version of `node.js` onto your computer.
2. Opening your terminal/shell, type: `npm install -g reveal-md` to install the `reveal-md` package, and other associated dependencies.  You need to be the administrator for your computer.  If you are on a Linux-based system (MacOS, Ubuntu, etc.) you may need to use `sudo npm install -g reveal-md`.
3. Navigate to the appropriate directory, or simply type `reveal-md path/to/file.md`.

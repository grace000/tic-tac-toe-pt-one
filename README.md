# Tic Tac Toe Game

[![Build Status](https://travis-ci.org/grace000/tic-tac-toe-pt-one.svg?branch=master)](https://travis-ci.org/grace000/tic-tac-toe-pt-one)

A classic tic tac toe game involves two players and a board with nine spaces. Each player will take turns filling a space with their token. At the start of the game, each player selects a token of their choice which will represent their selected board spaces. In order to win a game, a player has to gain three board spaces in a row. The row can be horizonal, vertical, or diagonal. If the board fills up before a player gains three spaces, the game will result in a draw. 

## Software and Installation 

To get started, you'll need the following software on your machine. Follow the links for installation instructions. 

- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)

## Installing

To get this game up and running in your command line, clone this repo and install dependencies by running the following in your terminal:

```
bundle install
```

## Usage

After installing the software and cloning the repo, you're ready to play the game. At the root folder, run:

```
ruby main.rb
```
You'll see a welcome note, prompting you to select a token and spaces as you play the game. Use the keyboard to make selections.

## Running the tests

Take a look in the spec folder for the tests. Feel free to add tests and run them from the root directory using the folliwing in the terminal:

```
bundle exec rspec spec
```

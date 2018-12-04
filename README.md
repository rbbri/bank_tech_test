# Bank tech test

This is a practice tech test for a banking application. The project is written in Ruby and is designed to be interacted with through a REPL

## Installation instructions

Clone this repo and run
```
bundle install
```
To run tests and view documentation
```
rspec --format doc
```

## Using the application

Using a REPL such as IRB or Pry
```
require './lib/account.rb'
```
To create an account
```
account = Account.new
```
To deposit
```
account.deposit(10)
```
To withdraw
```
account.withdraw(5)
```
To view a statement
```
account.statement
```

## Approach

  I started by creating an account class with an initial balance of zero and
  methods for deposit and withdraw. After adding guards for making sure the
  account does not go overdrawn and a deposit can not be used as a withdrawal,
  I extracted the account configuration to a separate class. A ledger class was
  added to track all transactions using the observer pattern and the Observable
  module. Statement configuration was extracted out of this class into a
  seperate module.

## User Stories

```
As a client,
So that I can manage my money
I would like to be able to open an account

As a client,
So that I can fund my account
I would like to be able to make a deposit

As a client,
So that I can access the funds in my account
I would like to be able to make a withdrawal

As a client,
So that I can track the funds in my account
I would like an account statement with the date of each transaction
```

# Instructions

* Click on a state to toggle Rep or Dem.
* Sure things are pre-marked for you.
* You can shut your browser and re-open - it remembers your choices.
  * If you want to forget what you chose and go back to the presets, click Reset
    * If you want to forget everything entirely ... just make it all go away ... we hear you. There isn't an app for that.
* Works on all modern browsers.

# Contributing/Coding etc

# Requirements

* Ruby 2.3.1
* `gem install bundler`
* `npm install -g bower`

## Installation

* Clone. `cd <folder>`.
* `bundle install`
* `bower install`

## Deployment

* Modify `aws_vars.sh.sample` to set your AWS credentials, and then type:
  ```
  . ./aws_var.sh.sample
  ```
  
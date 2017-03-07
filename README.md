# Gilded Rose

This is a tech test we have been given during MA course.


## Specification

### Requirements

* NB: Do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership
* All items have a SellIn value which denotes the number of days we have to sell the item.
* All items have a Quality value which denotes how valuable the item is.
* At the end of each day our system lowers both values for every item.
* Once the sell by date has passed, Quality degrades twice as fast
* The Quality of an item is never negative
* “Aged Brie” actually increases in Quality the older it gets
* The Quality of an item is never more than 50
* “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
* “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

## User Stories

As an host,
So to know which item to prioritize,
I want to know how many days I have for selling an item

As an host,
So to know the valuability of a product,
I want to give a quality value to each item
CRITERIA:
Quality value cannot be negative
Quality value cannot be more than 50

As an host,
So to keep my inventory up to date,
I want to lower the quality and selling days values at the end of each day.
CRITERIA:
Quality value degrades twice as faster after sell date

As an host,
So to properly value my products,
I want to certain cases for certain items defined.
CRITERIA:
“Aged Brie” increases in Quality the older it gets
“Sulfuras” when sold decreases in Quality
“Backstage passes” increases in Quality as it’s SellIn value approaches: Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
“Conjured” items degrade in Quality twice as fast as normal items

## Getting started

`git clone ...`  

## Usage
`irb`  

or  
`ruby app.rb`  

## Running tests

`rspec`

## Comments

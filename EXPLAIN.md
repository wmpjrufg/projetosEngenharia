# Explain

The code was designed to be used in a more user-friendly way. Therefore, it was necessary to divide the models (objects), data (instance of objects), page and calculators

## models
lib/models

The simple models of objects are here.

## data
lib/data

To create new pages with object instances, create data for this object. Use a ```Map<int, object>``` map for this.

## components
lib/component

A part of the page, sometimes the components will call the dates for create the page elements.
## page
lib/pages

It call the datas for create the page elements or it call the component.

## calculators
lib/calculators

Folders for create new calculators.

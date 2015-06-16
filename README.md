# slasherrb
[![Build Status](https://semaphoreci.com/api/v1/projects/58c6aef2-91c2-428e-a803-37a8e6ffac2d/445101/badge.svg)](https://semaphoreci.com/hafizbadrie/slasherrb)

This project is actually the ruby version of [slasherjs](https://github.com/hafizbadrie/slasherjs). Slasher is a library that could extract the main content of an HTML article document.
The result of extraction is depending of assumption on HTML document structure itself. Therefore, there may be flaws in the result if the document doesn't match the structure that is recognised by the library.
This condition will make the library will be improved from time to time.

## How To Use

To use the library, you need to have an HTML document first. In code, you will have like this.
```ruby
require 'net/http'
require 'slasher'

uri = "http://sea-games-2015.liputan6.com/read/2252937/all-indonesia-finals-ganda-putra-sumbang-emas"
html = Net::HTTP.get(uri)

slasher = Slasher.new(html)
content = slasher.slash

#content variable will have the main content of the HTML document (article).
```


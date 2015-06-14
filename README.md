# slasherrb
[![Build Status](https://semaphoreci.com/api/v1/projects/58c6aef2-91c2-428e-a803-37a8e6ffac2d/445101/badge.svg)](https://semaphoreci.com/hafizbadrie/slasherrb)      

Ruby version of slasherjs. A library to extract content of an article

## TODO
1. Implement recursive logic (main logic)
  * If content has `<p>`, then call `get_paragraphs_content`
  * If content doesn't have any children but text, push the text to contents with `push_contents`
  * If content still have children, then recursive to the child, or else, go to the next sibling tag
2. Refactor code
3. Implement main method
4. Publish as a gem

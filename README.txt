
Used MVVM Design pattern 
Not Used storyboards to design the UI. Loading view without storyboard. Programmatically created UI. 
Used Layout Anchors to layout the cells in the app. 
Created Extension for UIIMageView to cache images.
Used URLSession framework for making service calls
Supports for Iphone & iPad both Orientations


==============
Specification:
==============
• Ingests a json feed https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json  ======>[DONE]• You can use a third party Json parser to parse this if desired. ======>[DONE] • Displays the content (including image, title and description) in a table ======>[DONE]• The title in the navbar should be updated from the json [DONE]• Each row should be the right height to display its own content and no taller. No ======[DONE]content should be clipped. This means some rows will be larger than others. ======>[DONE]• Don’t download all images at once, only as needed ======>[DONE]• Refresh function, either a refresh button or use pull down to refresh. ======>[DONE]• Should not block UI when loading the data from the json feed.======>[DONE]• Support all iOS versions from the latest back at least 2 versions======>[DONE]

==========Guidelines
==========• Use Git to manage the source code. A clear Git history showing your process is required.======>[DONE]• Structure your code according to industry best practice design patterns======>[DONE]• Do not use any .xib files or Story Boards ======> Removed Storyboard created programatically [DONE]• Scrolling the table view should be smooth, even as images are downloading and gettingadded to the cells======>[DONE]• Support both iPhone and iPad (in both orientations) all devices including iPhoneX ======>[DONE]• If threading is used, do no spawn threads manually use GCD queues instead.======> [DONE]• Comment your code when necessary.======>[DONE]• Try to polish your code and the apps functionality as much as possible.======>[DONE]• Commit your changes to git in small chunks with meaningful comments ======>[DONE]• Feel free to use open source components via Cocoapods or Carthage if it makes sense
======>[Not necessary, Created class for downloading images]


=======================Additional Requirements 
=======================
• Style your code according to this style guide https://github.com/raywenderlich/swiftstyle- ======>[DONE]guide ======>[DONE]• Use programmatic auto layout using Layout Anchors to layout the cells in the app [DONE]• Use the URLSession framework for your service calls ======>[DONE]• Please use a TableView as the container ======>[DONE]
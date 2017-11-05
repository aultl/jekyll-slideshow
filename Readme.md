# Jekyll Slideshow Plugin
This is a plugin for the [Jekyll platform][0] to allow gallery/slidshows to be included.

## Why?
I looked all over for a plugin to create a slideshow. I only found one that was nolonger maintained.
I only wanted some very simple effects utilizing CSS and Javascript, but not jQuery. This is the result.

## Installation
Add the plugin to the _plugin folder.
Add the css and js to your assets folder and include them in your header

## Usage
In your makrdown add the following tag
```
{% slideshow /path/to/image/dir %}
```

When jekyll sees the slideshow tag it will replace the tag with a div listing all the images (.jpg or .png) in the referenced directory.

## Todo
* Add image height and width
* Add thumbnail creation
* Allow different types of effects

[0]: http://jekyllrb.com

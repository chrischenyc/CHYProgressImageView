CHYProgressImageView
====================

CHYProgressImageView is an iOS drop-in `UIImageView` subclass that displays its `image` content proportionally to the `progress` property set to it. If you feel the official UIProgressView is a bit dull and are looking for something than can add a flavor to your iPhone/iPad apps, CHYProgressImageView is what you want!

[![](https://dl.dropbox.com/u/12111329/github/CHYProgressImageView/1.jpg)](https://dl.dropbox.com/u/12111329/github/CHYProgressImageView/1.jpg)
[![](https://dl.dropbox.com/u/12111329/github/CHYProgressImageView/2.jpg)](https://dl.dropbox.com/u/12111329/github/CHYProgressImageView/2.jpg)
[![](https://dl.dropbox.com/u/12111329/github/CHYProgressImageView/3.jpg)](https://dl.dropbox.com/u/12111329/github/CHYProgressImageView/3.jpg)
[![](https://dl.dropbox.com/u/12111329/github/CHYProgressImageView/4.jpg)](https://dl.dropbox.com/u/12111329/github/CHYProgressImageView/4.jpg)

What the demo on Youtube: http://youtu.be/uTUluXUgRQM

Requirements
============

* iOS 5.0 and above
* Xcode 4.2 and above (CHYProgressImageView uses ARC. non-ARC support is planned in future version)
* Frameworks: Foundation, UIKit, CoreGraphics

Adding CHYProgressImageView to your project
====================================

The simplest way to add the CHYProgressImageView to your project is to directly add the `CHYProgressImageView.h` and `CHYProgressImageView.m` source files to your project.

1. Download the latest code version from the repository (you can simply use the Download Source button and get the zip or tar archive of the master branch).
2. Extract the archive.
3. Open your project in Xcode, than drag and drop `CHYProgressImageView.h` and `CHYProgressImageView.m` to your classes group (in the Groups & Files view). 
4. Make sure to select Copy items when asked. 

If you have a git tracked project, you can add CHYProgressImageView as a submodule to your project. 

1. Move inside your git tracked project.
2. Add CHYProgressImageView as a submodule using `git submodule add git://github.com/chenyuan/CHYProgressImageView.git CHYProgressImageView` .
3. Open your project in Xcode, than drag and drop `CHYProgressImageView.h` and `CHYProgressImageView.m` to your classes group (in the Groups & Files view). 
4. Don't select Copy items and select a suitable Reference type (relative to project should work fine most of the time). 

You can also add CHYProgressImageView as a static library to your workspace. See [this article](http://blog.carbonfive.com/2011/04/04/using-open-source-static-libraries-in-xcode-4/#using_a_static_library) for details. 

Usage
=====

* For use with xib files, make your `UIImageView` controls a `CHYProgressImageView` class in the xib.
* Or you can instantialize a `CHYProgressImageView` object the same way you work with `UIImageView`.

Properties
==========
* `float progress` - default 0.0. The image will be partially displayed in proportion to value set to this property.
* `BOOL hasGrayscaleBackground` - default YES. If set, the same image in grayscale is displayed in the background, providing viwer an indication of how far the progress has gone.
* `BOOL verticalProgress` - default YES. If set, the partially displaying of image will start from the bottom to the top; otherwise, left to right.

License
=======

This code is distributed under the terms and conditions of the MIT license. 

Copyright (c) 2012 Yuan Chen (chris@ciderstudios.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Change-log
==========

**Version 0.1** @ Aug 26, 2012

- Initial release.
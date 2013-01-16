# MimeInspector

A very simple library to get the mime type of a file by looking at the contents. Uses the file extension to disambiguate some common types such as application/zip.

## Installation

Install the latest stable release:

```
[sudo] gem install mime_inspector
```

In Rails, add it to your Gemfile:

```ruby
gem 'mime_inspector'
```

## Usage

```ruby
mime_type = MimeInspector.determine('/path/to/file')
```

If the file path is a temp file that does not include the original extension, you can pass the original filename as a second argument.

```ruby
mime_type = MimeInspector.determine(tmp_path, 'document.docx')
```

## License

Copyright (c) 2012-2013 Will Bond (Breuer & Co LLC) <wbond@breuer.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
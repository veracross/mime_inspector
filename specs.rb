require 'rspec'
require_relative 'lib/mime_inspector'

describe MimeInspector do
  it "should identify a keynote file" do
    MimeInspector.determine('files/keynote-test.key').should == 'application/vnd.apple.keynote'
  end

  it "should identify a pages file" do
    MimeInspector.determine('files/pages-test.pages').should == 'application/vnd.apple.pages'
  end

  it "should identify a numbers file" do
    MimeInspector.determine('files/numbers-test.numbers').should == 'application/vnd.apple.numbers'
  end

  it "should identify a pptx file" do
    MimeInspector.determine('files/presentation.pptx').should == 'application/vnd.openxmlformats-officedocument.presentationml.presentation'
  end

  it "should identify a xlsx file" do
    MimeInspector.determine('files/sheet.xlsx').should == 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
  end

  it "should identify a docx file" do
    MimeInspector.determine('files/document.docx').should == 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
  end
end

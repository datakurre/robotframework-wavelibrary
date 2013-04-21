WAVE-library for Robot Framework
================================

WAVE is an accessibility analyzing service and Firefox add-on created by
WebAIM. This library provides a few Robot Framework resources for executing
automated analyzes with the Firefox add-on.

(This package includes a Firefox profile with The WAVE Toolbar extension
installed. The WAVE toolbar, its interface elements, design elements,
functionality, and underlying code are © WebAIM. Distribution of the extension
with this library is done a permission from WebAIM.)

::

    $ pip install robotframework-wavelibrary

demo.robot::

    *** Settings ***

    Library  WAVELibrary

    Suite setup  Open WAVE browser
    Suite teardown  Close all browsers

    *** Test Cases ***

    Test check errors
        Check URL for accessibility errors  http://www.plone.org/

    Test validation with template
        [Template]  Check URL for accessibility errors
        http://www.plone.org/
        http://www.plone.org/

::

    $ pybot demo.robot

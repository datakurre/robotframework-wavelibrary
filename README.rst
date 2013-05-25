WAVE-library for Robot Framework
================================

WAVE is an accessibility analyzing service and Firefox add-on created by
WebAIM. This library provides a few Robot Framework resources for executing
automated analyzes with the Firefox add-on.

(This package includes a Firefox profile with The WAVE Toolbar extension
pre-installed. The WAVE toolbar, its interface elements, design elements,
functionality, and underlying code are © WebAIM.)

::

    $ pip install robotframework-wavelibrary

demo.robot::

    *** Settings ***

    Library  WAVELibrary

    Suite setup  Open WAVE browser
    Suite teardown  Close all browsers

    *** Test Cases ***

    Test single site
        Go to  http://www.plone.org/
        Check accessibility errors

    Test validation with template
        [Template]  Check URL for accessibility errors
        http://www.plone.org/
        http://www.drupal.org/
        http://www.joomla.org/
        http://www.wordpress.org/

::

    $ pybot demo.robot

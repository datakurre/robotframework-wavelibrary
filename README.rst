WAVE-library for Robot Framework
================================

WAVE is an accessibility analyzing service and Firefox add-on created by
WebAIM. This library provides Robot Framework resources for executing
automated analyzes with the Firefox add-on.

(This package includes a Firefox profile with WAVE toolbar extension
installed.)

::

    $ pip install robotframework-wavelibrary

demo.robot::

    *** Settings ***

    Resource  WAVE.robot

    Suite setup  Open WAVE-browser
    Suite teardown  Close all browsers

    *** Test Cases ***

    Test validation
        Validate  http://www.plone.org/

    Test validation with template
        [Template]  Validate
        http://www.plone.org/
        http://www.plone.org/

::

    $ pybot demo.robot

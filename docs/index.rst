Robot Framework WAVE-library
============================

Usage
-----

.. code:: robotframework

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

Keywords
--------

.. robot_keywords::
   :source: WAVELibrary:keywords.robot

Source
------

.. robot_source::
   :source: WAVELibrary:keywords.robot

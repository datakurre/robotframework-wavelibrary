Robot Framework WAVE-library
============================

Usage
-----

Include keywords with::

    Library  WAVELibrary

.. note::

   Currently, RIDE is unable to find keywords provided by this library when
   this library is imported with ``Library  WAVELibrary``. This can be fixed
   by requiring the library with ``Resource  WAVELibrary/keywords.robot``.
   (Currently all keywords are written as user keywords, but later they may be
   refactored into Python-keywords. If this happens, there will be backwards
   compatible wrappers available at ``keywords.robot``.)

Keywords
--------

.. robot_keywords::
   :source: WAVELibrary:keywords.robot

Source
------

.. robot_source::
   :source: WAVELibrary:keywords.robot

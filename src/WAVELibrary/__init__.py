# -*- coding: utf-8 -*-
from robot.libraries.BuiltIn import BuiltIn


class WAVELibrary(object):
    """WAVE is an accessibility analyzing service and Firefox add-on created by
    WebAIM. This library provides a few Robot Framework resources for executing
    automated analyzes with the Firefox add-on.

    """
    def __init__(self):
        self.import_WAVELibrary_resources()

    def import_WAVELibrary_resources(self):
        """Import WAVELibrary user keywords.
        """
        BuiltIn().import_resource('WAVELibrary/keywords.robot')

# -*- coding: utf-8 -*-
import os.path

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


class Cropping(object):

    def crop_wave_error_image(self, output_dir, filename, left, top, width, height):
        """Crop the saved image with given filename for the given dimensions.
        """
        from PIL import Image

        img = Image.open(os.path.join(output_dir, filename))
        box = (int(left), int(top), int(left + width), int(top + height))

        area = img.crop(box)

        with open(os.path.join(output_dir, filename), 'wb') as output:
            area.save(output, 'png')

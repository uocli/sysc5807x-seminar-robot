import os

class UtilityLibrary:
    def concatenate_strings(self, *args):
        """Concatenates multiple strings into one."""
        return ','.join(args)

    def split_string(self, string, delimiter=' '):
        """Splits a string by the given delimiter."""
        return string.split(delimiter)

    def get_file_extension(self, filename):
        """Returns the file extension of the given filename."""
        return os.path.splitext(filename)[1]


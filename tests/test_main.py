"""
Tests for very important function.
"""

from pyjen.main import main


def test_bar():
    """
    Do you have to ask?
    """
    assert main() == 42

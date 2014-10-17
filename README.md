AutoList
========

A vimscript to automatically insert, and renumber numeric lists in a file. If
you have a standard numeric list you normally have to go through a lot of hassle
maintaining it. If you add new items in the middle you have to renumber every
item under it. Well this makes that easier!

How to use it
-------------
Simply include the plugin in your plugins directory and it will do the rest.

Features
--------
1. Automatic list detection.
2. Automatic list continuation on newline.
3. Support for key mappings
4. Support for sub-lists

Notes
-----
1. AutoList remaps `<CR>` (in insert mode), `o`, and `O` (both in normal mode).
2. There are additional features in the works. I'd love some help though (this
	 is my first vimscript of any consequence).

Todo
====
[X] Get basic functionality working.
[X] Work with hierarchical lists.
[X] Figure out how to do key mappings for `enter`, `o`, and `O`.
		[X] Ensure that `enter`, `O`, and `o` work properly within a list.
		[X] Ensure that `enter` and `o` work properly at the end of a list.
		[X] Ensure that `O` works properly at the beginning of a list.
[ ] Add ability to delete one or more lines and `reList`.
[ ] Add the ability to paste one or more lines and `reList`.
[ ] Fix `addItem` when dealing with list items that span multiple lines (such as
    #2 in `Notes` above).
[ ] Automatically continue a list which has been separated by a sub-list (based
    off of indentation most likely).

Contributing
============
I welcome help from anyone more experienced in vimscripts than I am. Feel free
to take on one of the above todo items.

When aiming to contribute please follow these guidelines
1. In the commit title, start the commit message with `[DEV]` or `[TEST]`
	 appropriately based on what the commit focuses on.
2. Once you have completed your todo item, update the `Todo` list and submit a
	 pull request. You may also want to add yourself to the contributors -- give
	 credit where credit is due.
3. Maintain the coding style that is currently in place.

License
=======
MIT

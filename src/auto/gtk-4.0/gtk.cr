# Dependencies
require "../gsk-4.0/gsk.cr"
require "../gdk-4.0/gdk.cr"

# C lib declaration
require "./lib_gtk.cr"

# Wrappers
require "./about_dialog.cr"
require "./accessible.cr"
require "./action_bar.cr"
require "./actionable.cr"
require "./activate_action.cr"
require "./adjustment.cr"
require "./alternative_trigger.cr"
require "./any_filter.cr"
require "./app_chooser.cr"
require "./app_chooser_button.cr"
require "./app_chooser_dialog.cr"
require "./app_chooser_widget.cr"
require "./application.cr"
require "./application_window.cr"
require "./aspect_frame.cr"
require "./assistant.cr"
require "./assistant_page.cr"
require "./at_context.cr"
require "./bin_layout.cr"
require "./bitset.cr"
require "./bitset_iter.cr"
require "./bookmark_list.cr"
require "./bool_filter.cr"
require "./border.cr"
require "./box.cr"
require "./box_layout.cr"
require "./buildable.cr"
require "./buildable_parse_context.cr"
require "./buildable_parser.cr"
require "./builder.cr"
require "./builder_c_scope.cr"
require "./builder_list_item_factory.cr"
require "./builder_scope.cr"
require "./button.cr"
require "./c_closure_expression.cr"
require "./calendar.cr"
require "./callback_action.cr"
require "./cell_area.cr"
require "./cell_area_box.cr"
require "./cell_area_context.cr"
require "./cell_editable.cr"
require "./cell_layout.cr"
require "./cell_renderer.cr"
require "./cell_renderer_accel.cr"
require "./cell_renderer_combo.cr"
require "./cell_renderer_pixbuf.cr"
require "./cell_renderer_progress.cr"
require "./cell_renderer_spin.cr"
require "./cell_renderer_spinner.cr"
require "./cell_renderer_text.cr"
require "./cell_renderer_toggle.cr"
require "./cell_view.cr"
require "./center_box.cr"
require "./center_layout.cr"
require "./check_button.cr"
require "./closure_expression.cr"
require "./color_button.cr"
require "./color_chooser.cr"
require "./color_chooser_dialog.cr"
require "./color_chooser_widget.cr"
require "./column_view.cr"
require "./column_view_column.cr"
require "./combo_box.cr"
require "./combo_box_text.cr"
require "./constant_expression.cr"
require "./constraint.cr"
require "./constraint_guide.cr"
require "./constraint_layout.cr"
require "./constraint_layout_child.cr"
require "./constraint_target.cr"
require "./css_location.cr"
require "./css_provider.cr"
require "./css_section.cr"
require "./css_style_change.cr"
require "./custom_filter.cr"
require "./custom_layout.cr"
require "./custom_sorter.cr"
require "./dialog.cr"
require "./directory_list.cr"
require "./drag_icon.cr"
require "./drag_source.cr"
require "./drawing_area.cr"
require "./drop_controller_motion.cr"
require "./drop_down.cr"
require "./drop_target.cr"
require "./drop_target_async.cr"
require "./editable.cr"
require "./editable_label.cr"
require "./emoji_chooser.cr"
require "./entry.cr"
require "./entry_buffer.cr"
require "./entry_completion.cr"
require "./event_controller.cr"
require "./event_controller_focus.cr"
require "./event_controller_key.cr"
require "./event_controller_legacy.cr"
require "./event_controller_motion.cr"
require "./event_controller_scroll.cr"
require "./every_filter.cr"
require "./expander.cr"
require "./expression.cr"
require "./expression_watch.cr"
require "./file_chooser.cr"
require "./file_chooser_dialog.cr"
require "./file_chooser_native.cr"
require "./file_chooser_widget.cr"
require "./file_filter.cr"
require "./filter.cr"
require "./filter_list_model.cr"
require "./fixed.cr"
require "./fixed_layout.cr"
require "./fixed_layout_child.cr"
require "./flatten_list_model.cr"
require "./flow_box.cr"
require "./flow_box_child.cr"
require "./font_button.cr"
require "./font_chooser.cr"
require "./font_chooser_dialog.cr"
require "./font_chooser_widget.cr"
require "./frame.cr"
require "./gesture.cr"
require "./gesture_click.cr"
require "./gesture_drag.cr"
require "./gesture_long_press.cr"
require "./gesture_pan.cr"
require "./gesture_rotate.cr"
require "./gesture_single.cr"
require "./gesture_stylus.cr"
require "./gesture_swipe.cr"
require "./gesture_zoom.cr"
require "./gl_area.cr"
require "./grid.cr"
require "./grid_layout.cr"
require "./grid_layout_child.cr"
require "./grid_view.cr"
require "./header_bar.cr"
require "./icon_paintable.cr"
require "./icon_theme.cr"
require "./icon_view.cr"
require "./im_context.cr"
require "./im_context_simple.cr"
require "./im_multicontext.cr"
require "./image.cr"
require "./info_bar.cr"
require "./keyval_trigger.cr"
require "./label.cr"
require "./layout_child.cr"
require "./layout_manager.cr"
require "./level_bar.cr"
require "./link_button.cr"
require "./list_base.cr"
require "./list_box.cr"
require "./list_box_row.cr"
require "./list_item.cr"
require "./list_item_factory.cr"
require "./list_store.cr"
require "./list_view.cr"
require "./lock_button.cr"
require "./map_list_model.cr"
require "./media_controls.cr"
require "./media_file.cr"
require "./media_stream.cr"
require "./menu_button.cr"
require "./message_dialog.cr"
require "./mnemonic_action.cr"
require "./mnemonic_trigger.cr"
require "./mount_operation.cr"
require "./multi_filter.cr"
require "./multi_selection.cr"
require "./multi_sorter.cr"
require "./named_action.cr"
require "./native.cr"
require "./native_dialog.cr"
require "./never_trigger.cr"
require "./no_selection.cr"
require "./notebook.cr"
require "./notebook_page.cr"
require "./nothing_action.cr"
require "./numeric_sorter.cr"
require "./object_expression.cr"
require "./orientable.cr"
require "./overlay.cr"
require "./overlay_layout.cr"
require "./overlay_layout_child.cr"
require "./pad_action_entry.cr"
require "./pad_controller.cr"
require "./page_range.cr"
require "./page_setup.cr"
require "./page_setup_unix_dialog.cr"
require "./paned.cr"
require "./paper_size.cr"
require "./param_spec_expression.cr"
require "./password_entry.cr"
require "./password_entry_buffer.cr"
require "./picture.cr"
require "./popover.cr"
require "./popover_menu.cr"
require "./popover_menu_bar.cr"
require "./print_backend.cr"
require "./print_context.cr"
require "./print_job.cr"
require "./print_operation.cr"
require "./print_operation_preview.cr"
require "./print_settings.cr"
require "./print_unix_dialog.cr"
require "./printer.cr"
require "./progress_bar.cr"
require "./property_expression.cr"
require "./range.cr"
require "./recent_data.cr"
require "./recent_info.cr"
require "./recent_manager.cr"
require "./requested_size.cr"
require "./requisition.cr"
require "./revealer.cr"
require "./root.cr"
require "./scale.cr"
require "./scale_button.cr"
require "./scrollable.cr"
require "./scrollbar.cr"
require "./scrolled_window.cr"
require "./search_bar.cr"
require "./search_entry.cr"
require "./selection_filter_model.cr"
require "./selection_model.cr"
require "./separator.cr"
require "./settings.cr"
require "./shortcut.cr"
require "./shortcut_action.cr"
require "./shortcut_controller.cr"
require "./shortcut_label.cr"
require "./shortcut_manager.cr"
require "./shortcut_trigger.cr"
require "./shortcuts_group.cr"
require "./shortcuts_section.cr"
require "./shortcuts_shortcut.cr"
require "./shortcuts_window.cr"
require "./signal_action.cr"
require "./signal_list_item_factory.cr"
require "./single_selection.cr"
require "./size_group.cr"
require "./slice_list_model.cr"
require "./snapshot.cr"
require "./sort_list_model.cr"
require "./sorter.cr"
require "./spin_button.cr"
require "./spinner.cr"
require "./stack.cr"
require "./stack_page.cr"
require "./stack_sidebar.cr"
require "./stack_switcher.cr"
require "./statusbar.cr"
require "./string_filter.cr"
require "./string_list.cr"
require "./string_object.cr"
require "./string_sorter.cr"
require "./style_context.cr"
require "./style_provider.cr"
require "./switch.cr"
require "./symbolic_paintable.cr"
require "./text.cr"
require "./text_buffer.cr"
require "./text_child_anchor.cr"
require "./text_iter.cr"
require "./text_mark.cr"
require "./text_tag.cr"
require "./text_tag_table.cr"
require "./text_view.cr"
require "./toggle_button.cr"
require "./tooltip.cr"
require "./tree_drag_dest.cr"
require "./tree_drag_source.cr"
require "./tree_expander.cr"
require "./tree_iter.cr"
require "./tree_list_model.cr"
require "./tree_list_row.cr"
require "./tree_list_row_sorter.cr"
require "./tree_model.cr"
require "./tree_model_filter.cr"
require "./tree_model_sort.cr"
require "./tree_path.cr"
require "./tree_row_reference.cr"
require "./tree_selection.cr"
require "./tree_sortable.cr"
require "./tree_store.cr"
require "./tree_view.cr"
require "./tree_view_column.cr"
require "./video.cr"
require "./viewport.cr"
require "./volume_button.cr"
require "./widget.cr"
require "./widget_paintable.cr"
require "./window.cr"
require "./window_controls.cr"
require "./window_group.cr"
require "./window_handle.cr"

module Gtk
  # An undefined value. The accessible attribute is either unset, or its
  # value is undefined.
  ACCESSIBLE_VALUE_UNDEFINED = -1
  # Like `#binary_age`, but from the headers used at
  # application compile time, rather than from the library linked
  # against at application run time.
  BINARY_AGE                     = 602
  IM_MODULE_EXTENSION_POINT_NAME = "gtk-im-module"
  # Constant to return from a signal handler for the ::input
  # signal in case of conversion failure.
  #
  # See `Gtk::SpinButton::#input`.
  INPUT_ERROR = -1
  # Like `#interface_age`, but from the headers used at
  # application compile time, rather than from the library linked
  # against at application run time.
  INTERFACE_AGE = 2
  # The value used to refer to a guaranteed invalid position
  # in a `GListModel`.
  #
  # This value may be returned from some functions, others may
  # accept it as input. Its interpretation may differ for different
  # functions.
  #
  # Refer to each function's documentation for if this value is
  # allowed and what it does.
  INVALID_LIST_POSITION = 4294967295_u32
  # The name used for the stock full offset included by `GtkLevelBar`.
  LEVEL_BAR_OFFSET_FULL = "full"
  # The name used for the stock high offset included by `GtkLevelBar`.
  LEVEL_BAR_OFFSET_HIGH = "high"
  # The name used for the stock low offset included by `GtkLevelBar`.
  LEVEL_BAR_OFFSET_LOW = "low"
  # Like `#major_version`, but from the headers used at
  # application compile time, rather than from the library linked
  # against at application run time.
  MAJOR_VERSION                   = 4
  MAX_COMPOSE_LEN                 = 7
  MEDIA_FILE_EXTENSION_POINT_NAME = "gtk-media-file"
  # Like `#micro_version`, but from the headers used at
  # application compile time, rather than from the library linked
  # against at application run time.
  MICRO_VERSION = 2
  # Like `#minor_version`, but from the headers used at
  # application compile time, rather than from the library linked
  # against at application run time.
  MINOR_VERSION = 6
  # Name for the A3 paper size.
  PAPER_NAME_A3 = "iso_a3"
  # Name for the A4 paper size.
  PAPER_NAME_A4 = "iso_a4"
  # Name for the A5 paper size.
  PAPER_NAME_A5 = "iso_a5"
  # Name for the B5 paper size.
  PAPER_NAME_B5 = "iso_b5"
  # Name for the Executive paper size.
  PAPER_NAME_EXECUTIVE = "na_executive"
  # Name for the Legal paper size.
  PAPER_NAME_LEGAL = "na_legal"
  # Name for the Letter paper size.
  PAPER_NAME_LETTER               = "na_letter"
  PRINT_SETTINGS_COLLATE          = "collate"
  PRINT_SETTINGS_DEFAULT_SOURCE   = "default-source"
  PRINT_SETTINGS_DITHER           = "dither"
  PRINT_SETTINGS_DUPLEX           = "duplex"
  PRINT_SETTINGS_FINISHINGS       = "finishings"
  PRINT_SETTINGS_MEDIA_TYPE       = "media-type"
  PRINT_SETTINGS_NUMBER_UP        = "number-up"
  PRINT_SETTINGS_NUMBER_UP_LAYOUT = "number-up-layout"
  PRINT_SETTINGS_N_COPIES         = "n-copies"
  PRINT_SETTINGS_ORIENTATION      = "orientation"
  # The key used by the “Print to file” printer to store the file
  # name of the output without the path to the directory and the
  # file extension.
  PRINT_SETTINGS_OUTPUT_BASENAME = "output-basename"
  PRINT_SETTINGS_OUTPUT_BIN      = "output-bin"
  # The key used by the “Print to file” printer to store the
  # directory to which the output should be written.
  PRINT_SETTINGS_OUTPUT_DIR = "output-dir"
  # The key used by the “Print to file” printer to store the format
  # of the output. The supported values are “PS” and “PDF”.
  PRINT_SETTINGS_OUTPUT_FILE_FORMAT = "output-file-format"
  # The key used by the “Print to file” printer to store the URI
  # to which the output should be written. GTK itself supports
  # only “file://” URIs.
  PRINT_SETTINGS_OUTPUT_URI           = "output-uri"
  PRINT_SETTINGS_PAGE_RANGES          = "page-ranges"
  PRINT_SETTINGS_PAGE_SET             = "page-set"
  PRINT_SETTINGS_PAPER_FORMAT         = "paper-format"
  PRINT_SETTINGS_PAPER_HEIGHT         = "paper-height"
  PRINT_SETTINGS_PAPER_WIDTH          = "paper-width"
  PRINT_SETTINGS_PRINTER              = "printer"
  PRINT_SETTINGS_PRINTER_LPI          = "printer-lpi"
  PRINT_SETTINGS_PRINT_PAGES          = "print-pages"
  PRINT_SETTINGS_QUALITY              = "quality"
  PRINT_SETTINGS_RESOLUTION           = "resolution"
  PRINT_SETTINGS_RESOLUTION_X         = "resolution-x"
  PRINT_SETTINGS_RESOLUTION_Y         = "resolution-y"
  PRINT_SETTINGS_REVERSE              = "reverse"
  PRINT_SETTINGS_SCALE                = "scale"
  PRINT_SETTINGS_USE_COLOR            = "use-color"
  PRINT_SETTINGS_WIN32_DRIVER_EXTRA   = "win32-driver-extra"
  PRINT_SETTINGS_WIN32_DRIVER_VERSION = "win32-driver-version"
  # Use this priority for functionality related to size allocation.
  #
  # It is used internally by GTK+ to compute the sizes of widgets.
  # This priority is higher than %GDK_PRIORITY_REDRAW to avoid
  # resizing a widget which was just redrawn.
  PRIORITY_RESIZE = 110
  # A priority that can be used when adding a `GtkStyleProvider`
  # for application-specific style information.
  STYLE_PROVIDER_PRIORITY_APPLICATION = 600
  # The priority used for default style information
  # that is used in the absence of themes.
  #
  # Note that this is not very useful for providing default
  # styling for custom style classes - themes are likely to
  # override styling provided at this priority with
  # catch-all `* {...}` rules.
  STYLE_PROVIDER_PRIORITY_FALLBACK = 1
  # The priority used for style information provided
  # via `GtkSettings`.
  #
  # This priority is higher than %GTK_STYLE_PROVIDER_PRIORITY_THEME
  # to let settings override themes.
  STYLE_PROVIDER_PRIORITY_SETTINGS = 400
  # The priority used for style information provided
  # by themes.
  STYLE_PROVIDER_PRIORITY_THEME = 200
  # The priority used for the style information from
  # `$XDG_CONFIG_HOME/gtk-4.0/gtk.css`.
  #
  # You should not use priorities higher than this, to
  # give the user the last word.
  STYLE_PROVIDER_PRIORITY_USER = 800
  # The priority at which the text view validates onscreen lines
  # in an idle job in the background.
  TEXT_VIEW_PRIORITY_VALIDATE = 125
  # Uses the default sort function in a `Gtk#TreeSortable`.
  #
  # See also: `Gtk::TreeSortable#sort_column_id=`
  TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID = -1
  # Disables sorting in a `Gtk#TreeSortable`.
  #
  # See also: `Gtk::TreeSortable#sort_column_id=`
  TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID = -2

  # Callbacks

  # Type of callback used to calculate the next page in a `GtkAssistant`.
  #
  # It’s called both for computing the next page when the user presses the
  # “forward” button and for handling the behavior of the “last” button.
  #
  # See `Gtk::Assistant#forward_page_func=`.
  alias AssistantPageFunc = Proc(Int32, Int32)

  # The type of the callback functions used for iterating over the
  # cell renderers and their allocated areas inside a `GtkCellArea`,
  # see gtk_cell_area_foreach_alloc().
  alias CellAllocCallback = Proc(Gtk::CellRenderer, Gdk::Rectangle, Gdk::Rectangle, Bool)

  # The type of the callback functions used for iterating over
  # the cell renderers of a `GtkCellArea`, see gtk_cell_area_foreach().
  alias CellCallback = Proc(Gtk::CellRenderer, Bool)

  # A function which should set the value of @cell_layout’s cell renderer(s)
  # as appropriate.
  alias CellLayoutDataFunc = Proc(Gtk::CellLayout, Gtk::CellRenderer, Gtk::TreeModel, Gtk::TreeIter, Nil)

  # A function to be used by `GtkCustomLayout` to allocate a widget.
  alias CustomAllocateFunc = Proc(Gtk::Widget, Int32, Int32, Nil)

  # User function that is called to determine if the @item should be matched.
  #
  # If the filter matches the item, this function must return %TRUE. If the
  # item should be filtered out, %FALSE must be returned.
  alias CustomFilterFunc = Proc(GObject::Object, Bool)

  # A function to be used by `GtkCustomLayout` to measure a widget.
  alias CustomMeasureFunc = Proc(Gtk::Widget, Gtk::Orientation, Int32, Int32, Int32, Int32, Nil)

  # Queries a widget for its preferred size request mode.
  alias CustomRequestModeFunc = Proc(Gtk::SizeRequestMode)

  # Whenever @drawing_area needs to redraw, this function will be called.
  #
  # This function should exclusively redraw the contents of the drawing area
  # and must not call any widget functions that cause changes.
  alias DrawingAreaDrawFunc = Proc(Gtk::DrawingArea, Cairo::Context, Int32, Int32, Nil)

  # A function which decides whether the row indicated by @iter matches
  # a given @key, and should be displayed as a possible completion for @key.
  #
  # Note that @key is normalized and case-folded (see g_utf8_normalize()
  # and g_utf8_casefold()). If this is not appropriate, match functions
  # have access to the unmodified key via
  # `gtk_editable_get_text (GTK_EDITABLE (gtk_entry_completion_get_entry ()))`.
  alias EntryCompletionMatchFunc = Proc(Gtk::EntryCompletion, ::String, Gtk::TreeIter, Bool)

  # Callback called by gtk_expression_watch() when the
  # expression value changes.
  alias ExpressionNotify = Proc(Nil)

  # Called for flow boxes that are bound to a `GListModel`.
  #
  # This function is called for each item that gets added to the model.
  alias FlowBoxCreateWidgetFunc = Proc(GObject::Object, Gtk::Widget)

  # A function that will be called whenever a child changes
  # or is added.
  #
  # It lets you control if the child should be visible or not.
  alias FlowBoxFilterFunc = Proc(Gtk::FlowBoxChild, Bool)

  # A function used by gtk_flow_box_selected_foreach().
  #
  # It will be called on every selected child of the @box.
  alias FlowBoxForeachFunc = Proc(Gtk::FlowBox, Gtk::FlowBoxChild, Nil)

  # A function to compare two children to determine which
  # should come first.
  alias FlowBoxSortFunc = Proc(Gtk::FlowBoxChild, Gtk::FlowBoxChild, Int32)

  # The type of function that is used for deciding what fonts get
  # shown in a `GtkFontChooser`.
  #
  # See `Gtk::FontChooser#filter_func=`.
  alias FontFilterFunc = Proc(Pango::FontFamily, Pango::FontFace, Bool)

  # A function used by gtk_icon_view_selected_foreach() to map all
  # selected rows.
  #
  # It will be called on every selected row in the view.
  alias IconViewForeachFunc = Proc(Gtk::IconView, Gtk::TreePath, Nil)

  # Called for list boxes that are bound to a `GListModel` with
  # gtk_list_box_bind_model() for each item that gets added to the model.
  #
  # If the widget returned is not a #GtkListBoxRow widget, then the widget
  # will be inserted as the child of an intermediate #GtkListBoxRow.
  alias ListBoxCreateWidgetFunc = Proc(GObject::Object, Gtk::Widget)

  # Will be called whenever the row changes or is added and lets you control
  # if the row should be visible or not.
  alias ListBoxFilterFunc = Proc(Gtk::ListBoxRow, Bool)

  # A function used by gtk_list_box_selected_foreach().
  #
  # It will be called on every selected child of the @box.
  alias ListBoxForeachFunc = Proc(Gtk::ListBox, Gtk::ListBoxRow, Nil)

  # Compare two rows to determine which should be first.
  alias ListBoxSortFunc = Proc(Gtk::ListBoxRow, Gtk::ListBoxRow, Int32)

  # Whenever @row changes or which row is before @row changes this
  # is called, which lets you update the header on @row.
  #
  # You may remove or set a new one via `Gtk::ListBoxRow#header=`
  # or just change the state of the current header widget.
  alias ListBoxUpdateHeaderFunc = Proc(Gtk::ListBoxRow, Gtk::ListBoxRow?, Nil)

  # User function that is called to map an @item of the original model to
  # an item expected by the map model.
  #
  # The returned items must conform to the item type of the model they are
  # used with.
  alias MapListModelMapFunc = Proc(GObject::Object, GObject::Object)

  # User-provided callback function to create a popup for a
  # `GtkMenuButton` on demand.
  #
  # This function is called when the popup of @menu_button is shown,
  # but none has been provided via `Gtk::MenuButton#popover=`
  # or `Gtk::MenuButton#menu_model=`.
  alias MenuButtonCreatePopupFunc = Proc(Gtk::MenuButton, Nil)

  # The type of function that is passed to
  # gtk_print_run_page_setup_dialog_async().
  #
  # This function will be called when the page setup dialog
  # is dismissed, and also serves as destroy notify for @data.
  alias PageSetupDoneFunc = Proc(Gtk::PageSetup, Nil)

  # The type of callback that is passed to gtk_print_job_send().
  #
  # It is called when the print job has been completely sent.
  alias PrintJobCompleteFunc = Proc(Gtk::PrintJob, Pointer(Void)?, Nil)

  alias PrintSettingsFunc = Proc(::String, ::String, Nil)

  # The type of function passed to gtk_enumerate_printers().
  #
  # Note that you need to ref @printer, if you want to keep
  # a reference to it after the function has returned.
  alias PrinterFunc = Proc(Gtk::Printer, Bool)

  alias ScaleFormatValueFunc = Proc(Gtk::Scale, Float64, ::String)

  # Prototype for shortcuts based on user callbacks.
  alias ShortcutFunc = Proc(Gtk::Widget, GLib::Variant?, Bool)

  # The predicate function used by gtk_text_iter_forward_find_char() and
  # gtk_text_iter_backward_find_char().
  alias TextCharPredicate = Proc(UInt32, Bool)

  # A function used with gtk_text_tag_table_foreach(),
  # to iterate over every `GtkTextTag` inside a `GtkTextTagTable`.
  alias TextTagTableForeach = Proc(Gtk::TextTag, Nil)

  # Callback type for adding a function to update animations. See gtk_widget_add_tick_callback().
  alias TickCallback = Proc(Gtk::Widget, Gdk::FrameClock, Bool)

  # A function to set the properties of a cell instead of just using the
  # straight mapping between the cell and the model.
  #
  # This function is useful for customizing the cell renderer. For example,
  # a function might get an* integer from the @tree_model, and render it to
  # the “text” attribute of “cell” by converting it to its written equivalent.
  #
  # See also: gtk_tree_view_column_set_cell_data_func()
  alias TreeCellDataFunc = Proc(Gtk::TreeViewColumn, Gtk::CellRenderer, Gtk::TreeModel, Gtk::TreeIter, Nil)

  # A GtkTreeIterCompareFunc should return a negative integer, zero, or a positive
  # integer if @a sorts before @b, @a sorts with @b, or @a sorts after @b
  # respectively.
  #
  # If two iters compare as equal, their order in the sorted model
  # is undefined. In order to ensure that the `GtkTreeSortable` behaves as
  # expected, the GtkTreeIterCompareFunc must define a partial order on
  # the model, i.e. it must be reflexive, antisymmetric and transitive.
  #
  # For example, if @model is a product catalogue, then a compare function
  # for the “price” column could be one which returns
  # `price_of(@a) - price_of(@b)`.
  alias TreeIterCompareFunc = Proc(Gtk::TreeModel, Gtk::TreeIter, Gtk::TreeIter, Int32)

  # Prototype of the function called to create new child models when
  # gtk_tree_list_row_set_expanded() is called.
  #
  # This function can return %NULL to indicate that @item is guaranteed to be
  # a leaf node and will never have children. If it does not have children but
  # may get children later, it should return an empty model that is filled once
  # children arrive.
  alias TreeListModelCreateModelFunc = Proc(GObject::Object, Gio::ListModel)

  # A function which calculates display values from raw values in the model.
  # It must fill @value with the display value for the column @column in the
  # row indicated by @iter.
  #
  # Since this function is called for each data access, it’s not a
  # particularly efficient operation.
  alias TreeModelFilterModifyFunc = Proc(Gtk::TreeModel, Gtk::TreeIter, GObject::Value, Int32, Nil)

  # A function which decides whether the row indicated by @iter is visible.
  alias TreeModelFilterVisibleFunc = Proc(Gtk::TreeModel, Gtk::TreeIter, Bool)

  # Type of the callback passed to gtk_tree_model_foreach() to
  # iterate over the rows in a tree model.
  alias TreeModelForeachFunc = Proc(Gtk::TreeModel, Gtk::TreePath, Gtk::TreeIter, Bool)

  # A function used by gtk_tree_selection_selected_foreach() to map all
  # selected rows.  It will be called on every selected row in the view.
  alias TreeSelectionForeachFunc = Proc(Gtk::TreeModel, Gtk::TreePath, Gtk::TreeIter, Nil)

  # A function used by gtk_tree_selection_set_select_function() to filter
  # whether or not a row may be selected. It is called whenever a row's
  # state might change.
  #
  # A return value of %TRUE indicates to @selection that it is okay to
  # change the selection.
  alias TreeSelectionFunc = Proc(Gtk::TreeSelection, Gtk::TreeModel, Gtk::TreePath, Bool, Bool)

  # Function type for determining whether @column can be dropped in a
  # particular spot (as determined by @prev_column and @next_column).  In
  # left to right locales, @prev_column is on the left of the potential drop
  # spot, and @next_column is on the right.  In right to left mode, this is
  # reversed.  This function should return %TRUE if the spot is a valid drop
  # spot.  Please note that returning %TRUE does not actually indicate that
  # the column drop was made, but is meant only to indicate a possible drop
  # spot to the user.
  alias TreeViewColumnDropFunc = Proc(Gtk::TreeView, Gtk::TreeViewColumn, Gtk::TreeViewColumn, Gtk::TreeViewColumn, Bool)

  # Function used for gtk_tree_view_map_expanded_rows().
  alias TreeViewMappingFunc = Proc(Gtk::TreeView, Gtk::TreePath, Nil)

  # Function type for determining whether the row pointed to by @iter should
  # be rendered as a separator. A common way to implement this is to have a
  # boolean column in the model, whose values the `GtkTreeViewRowSeparatorFunc`
  # returns.
  alias TreeViewRowSeparatorFunc = Proc(Gtk::TreeModel, Gtk::TreeIter, Bool)

  # A function used for checking whether a row in @model matches
  # a search key string entered by the user. Note the return value
  # is reversed from what you would normally expect, though it
  # has some similarity to strcmp() returning 0 for equal strings.
  alias TreeViewSearchEqualFunc = Proc(Gtk::TreeModel, Int32, ::String, Gtk::TreeIter, Bool)

  # The type of the callback functions used for activating
  # actions installed with gtk_widget_class_install_action().
  #
  # The @parameter must match the @parameter_type of the action.
  alias WidgetActionActivateFunc = Proc(Gtk::Widget, ::String, Nil)

  # Base class for all errors in this module.
  class GtkError < RuntimeError
    # :nodoc:
    def initialize(error : Pointer(LibGLib::Error))
      message_ptr = error.value.message
      super(String.new(message_ptr)) unless message_ptr.null?
      LibGLib.g_error_free(error)
    end
  end

  # Enums

  # The possible values for the %GTK_ACCESSIBLE_PROPERTY_AUTOCOMPLETE
  # accessible property.
  enum AccessibleAutocomplete : UInt32
    # Automatic suggestions are not displayed.
    None = 0
    # When a user is providing input, text
    #    suggesting one way to complete the provided input may be dynamically
    #    inserted after the caret.
    Inline = 1
    # When a user is providing input, an element
    #    containing a collection of values that could complete the provided input
    #    may be displayed.
    List = 2
    # When a user is providing input, an element
    #    containing a collection of values that could complete the provided input
    #    may be displayed. If displayed, one value in the collection is automatically
    #    selected, and the text needed to complete the automatically selected value
    #    appears after the caret in the input.
    Both = 3
  end

  # The possible values for the %GTK_ACCESSIBLE_STATE_INVALID
  # accessible state.
  #
  # Note that the %GTK_ACCESSIBLE_INVALID_FALSE and
  # %GTK_ACCESSIBLE_INVALID_TRUE have the same values
  # as %FALSE and %TRUE.
  enum AccessibleInvalidState : UInt32
    # There are no detected errors in the value
    False = 0
    # The value entered by the user has failed validation
    True = 1
    # A grammatical error was detected
    Grammar = 2
    # A spelling error was detected
    Spelling = 3
  end

  # The possible accessible properties of a `#Accessible`.
  enum AccessibleProperty : UInt32
    # Indicates whether inputting text
    #    could trigger display of one or more predictions of the user's intended
    #    value for a combobox, searchbox, or textbox and specifies how predictions
    #    would be presented if they were made. Value type: `#AccessibleAutocomplete`
    Autocomplete = 0
    # Defines a string value that describes
    #    or annotates the current element. Value type: string
    Description = 1
    # Indicates the availability and type of
    #    interactive popup element, such as menu or dialog, that can be triggered
    #    by an element.
    HasPopup = 2
    # Indicates keyboard shortcuts that an
    #    author has implemented to activate or give focus to an element. Value type:
    #    string
    KeyShortcuts = 3
    # Defines a string value that labels the current
    #    element. Value type: string
    Label = 4
    # Defines the hierarchical level of an element
    #    within a structure. Value type: integer
    Level = 5
    # Indicates whether an element is modal when
    #    displayed. Value type: boolean
    Modal = 6
    # Indicates whether a text box accepts
    #    multiple lines of input or only a single line. Value type: boolean
    MultiLine = 7
    # Indicates that the user may select
    #    more than one item from the current selectable descendants. Value type:
    #    boolean
    MultiSelectable = 8
    # Indicates whether the element's
    #    orientation is horizontal, vertical, or unknown/ambiguous. Value type:
    #    `#Orientation`
    Orientation = 9
    # Defines a short hint (a word or short
    #    phrase) intended to aid the user with data entry when the control has no
    #    value. A hint could be a sample value or a brief description of the expected
    #    format. Value type: string
    Placeholder = 10
    # Indicates that the element is not editable,
    #    but is otherwise operable. Value type: boolean
    ReadOnly = 11
    # Indicates that user input is required on
    #    the element before a form may be submitted. Value type: boolean
    Required = 12
    # Defines a human-readable,
    #    author-localized description for the role of an element. Value type: string
    RoleDescription = 13
    # Indicates if items in a table or grid are
    #    sorted in ascending or descending order. Value type: `#AccessibleSort`
    Sort = 14
    # Defines the maximum allowed value for a
    #    range widget. Value type: double
    ValueMax = 15
    # Defines the minimum allowed value for a
    #    range widget. Value type: double
    ValueMin = 16
    # Defines the current value for a range widget.
    #    Value type: double
    ValueNow = 17
    # Defines the human readable text alternative
    #    of aria-valuenow for a range widget. Value type: string
    ValueText = 18
  end

  # The possible accessible relations of a `#Accessible`.
  #
  # Accessible relations can be references to other widgets,
  # integers or strings.
  enum AccessibleRelation : UInt32
    # Identifies the currently active
    #    element when focus is on a composite widget, combobox, textbox, group,
    #    or application. Value type: reference
    ActiveDescendant = 0
    # Defines the total number of columns
    #    in a table, grid, or treegrid. Value type: integer
    ColCount = 1
    # Defines an element's column index or
    #    position with respect to the total number of columns within a table,
    #    grid, or treegrid. Value type: integer
    ColIndex = 2
    # Defines a human readable text
    #   alternative of %GTK_ACCESSIBLE_RELATION_COL_INDEX. Value type: string
    ColIndexText = 3
    # Defines the number of columns spanned
    #   by a cell or gridcell within a table, grid, or treegrid. Value type: integer
    ColSpan = 4
    # Identifies the element (or elements) whose
    #    contents or presence are controlled by the current element. Value type: reference
    Controls = 5
    # Identifies the element (or elements)
    #    that describes the object. Value type: reference
    DescribedBy = 6
    # Identifies the element (or elements) that
    #    provide additional information related to the object. Value type: reference
    Details = 7
    # Identifies the element that provides
    #    an error message for an object. Value type: reference
    ErrorMessage = 8
    # Identifies the next element (or elements)
    #    in an alternate reading order of content which, at the user's discretion,
    #    allows assistive technology to override the general default of reading in
    #    document source order. Value type: reference
    FlowTo = 9
    # Identifies the element (or elements)
    #    that labels the current element. Value type: reference
    LabelledBy = 10
    # Identifies an element (or elements) in order
    #    to define a visual, functional, or contextual parent/child relationship
    #    between elements where the widget hierarchy cannot be used to represent
    #    the relationship. Value type: reference
    Owns = 11
    # Defines an element's number or position
    #    in the current set of listitems or treeitems. Value type: integer
    PosInSet = 12
    # Defines the total number of rows in a table,
    #    grid, or treegrid. Value type: integer
    RowCount = 13
    # Defines an element's row index or position
    #    with respect to the total number of rows within a table, grid, or treegrid.
    #    Value type: integer
    RowIndex = 14
    # Defines a human readable text
    #    alternative of aria-rowindex. Value type: string
    RowIndexText = 15
    # Defines the number of rows spanned by a
    #    cell or gridcell within a table, grid, or treegrid. Value type: integer
    RowSpan = 16
    # Defines the number of items in the current
    #    set of listitems or treeitems. Value type: integer
    SetSize = 17
  end

  # The accessible role for a `#Accessible` implementation.
  #
  # Abstract roles are only used as part of the ontology; application
  # developers must not use abstract roles in their code.
  enum AccessibleRole : UInt32
    # An element with important, and usually
    #   time-sensitive, information
    Alert = 0
    # A type of dialog that contains an
    #   alert message
    AlertDialog = 1
    # Unused
    Banner = 2
    # An input element that allows for
    #   user-triggered actions when clicked or pressed
    Button = 3
    # Unused
    Caption = 4
    # Unused
    Cell = 5
    # A checkable input element that has
    #   three possible values: `true`, `false`, or `mixed`
    Checkbox = 6
    # A header in a columned list.
    ColumnHeader = 7
    # An input that controls another element,
    #   such as a list or a grid, that can dynamically pop up to help the user
    #   set the value of the input
    ComboBox = 8
    # Abstract role.
    Command = 9
    # Abstract role.
    Composite = 10
    # A dialog is a window that is designed to interrupt
    #    the current processing of an application in order to prompt the user to enter
    #    information or require a response.
    Dialog = 11
    # Unused
    Document = 12
    # Unused
    Feed = 13
    # Unused
    Form = 14
    # Unused
    Generic = 15
    # A grid of items.
    Grid = 16
    # An item in a grid or tree grid.
    GridCell = 17
    # An element that groups multiple widgets. GTK uses
    #   this role for various containers, like `#Box`, `#Viewport`, and `#HeaderBar`.
    Group = 18
    # Unused
    Heading = 19
    # An image.
    Img = 20
    # Abstract role.
    Input = 21
    # A visible name or caption for a user interface component.
    Label = 22
    # Abstract role.
    Landmark = 23
    # Unused
    Legend = 24
    # A clickable link.
    Link = 25
    # A list of items.
    List = 26
    # Unused.
    ListBox = 27
    # An item in a list.
    ListItem = 28
    # Unused
    Log = 29
    # Unused
    Main = 30
    # Unused
    Marquee = 31
    # Unused
    Math = 32
    # An element that represents a value within a known range.
    Meter = 33
    # A menu.
    Menu = 34
    # A menubar.
    MenuBar = 35
    # An item in a menu.
    MenuItem = 36
    # A check item in a menu.
    MenuItemCheckbox = 37
    # A radio item in a menu.
    MenuItemRadio = 38
    # Unused
    Navigation = 39
    # An element that is not represented to accessibility technologies.
    None = 40
    # Unused
    Note = 41
    # Unused
    Option = 42
    # An element that is not represented to accessibility technologies.
    Presentation = 43
    # An element that displays the progress
    #    status for tasks that take a long time.
    ProgressBar = 44
    # A checkable input in a group of radio roles,
    #    only one of which can be checked at a time.
    Radio = 45
    # Unused
    RadioGroup = 46
    # Abstract role.
    Range = 47
    # Unused
    Region = 48
    # A row in a columned list.
    Row = 49
    # Unused
    RowGroup = 50
    # Unused
    RowHeader = 51
    # A graphical object that controls the scrolling
    #    of content within a viewing area, regardless of whether the content is fully
    #    displayed within the viewing area.
    Scrollbar = 52
    # Unused
    Search = 53
    # A type of textbox intended for specifying
    #    search criteria.
    SearchBox = 54
    # Abstract role.
    Section = 55
    # Abstract role.
    SectionHead = 56
    # Abstract role.
    Select = 57
    # A divider that separates and distinguishes
    #    sections of content or groups of menuitems.
    Separator = 58
    # A user input where the user selects a value
    #    from within a given range.
    Slider = 59
    # A form of range that expects the user to
    #    select from among discrete choices.
    SpinButton = 60
    # Unused
    Status = 61
    # Abstract role.
    Structure = 62
    # A type of checkbox that represents on/off values,
    #    as opposed to checked/unchecked values.
    Switch = 63
    # An item in a list of tab used for switching pages.
    Tab = 64
    # Unused
    Table = 65
    # A list of tabs for switching pages.
    TabList = 66
    # A page in a notebook or stack.
    TabPanel = 67
    # A type of input that allows free-form text
    #    as its value.
    TextBox = 68
    # Unused
    Time = 69
    # Unused
    Timer = 70
    # Unused
    Toolbar = 71
    # Unused
    Tooltip = 72
    # Unused
    Tree = 73
    # A treeview-like, columned list.
    TreeGrid = 74
    # Unused
    TreeItem = 75
    # An interactive component of a graphical user
    #    interface. This is the role that GTK uses by default for widgets.
    Widget = 76
    # An application window.
    Window = 77
  end

  # The possible values for the %GTK_ACCESSIBLE_PROPERTY_SORT
  # accessible property.
  enum AccessibleSort : UInt32
    # There is no defined sort applied to the column.
    None = 0
    # Items are sorted in ascending order by this column.
    Ascending = 1
    # Items are sorted in descending order by this column.
    Descending = 2
    # A sort algorithm other than ascending or
    #    descending has been applied.
    Other = 3
  end

  # The possible accessible states of a `#Accessible`.
  enum AccessibleState : UInt32
    # A “busy” state. This state has boolean values
    Busy = 0
    # A “checked” state; indicates the current
    #   state of a `#CheckButton`. Value type: `#AccessibleTristate`
    Checked = 1
    # A “disabled” state; corresponds to the
    #   `Widget#sensitive` property. It indicates a UI element
    #   that is perceivable, but not editable or operable. Value type: boolean
    Disabled = 2
    # An “expanded” state; corresponds to the
    #   `Expander#expanded` property. Value type: boolean
    #   or undefined
    Expanded = 3
    # A “hidden” state; corresponds to the
    #   `Widget#visible` property. You can use this state
    #   explicitly on UI elements that should not be exposed to an assistive
    #   technology. Value type: boolean
    #   See also: %GTK_ACCESSIBLE_STATE_DISABLED
    Hidden = 4
    # An “invalid” state; set when a widget
    #   is showing an error. Value type: `#AccessibleInvalidState`
    Invalid = 5
    # A “pressed” state; indicates the current
    #   state of a `#ToggleButton`. Value type: `#AccessibleTristate`
    #   enumeration
    Pressed = 6
    # A “selected” state; set when a widget
    #   is selected. Value type: boolean or undefined
    Selected = 7
  end

  # The possible values for the %GTK_ACCESSIBLE_STATE_PRESSED
  # accessible state.
  #
  # Note that the %GTK_ACCESSIBLE_TRISTATE_FALSE and
  # %GTK_ACCESSIBLE_TRISTATE_TRUE have the same values
  # as %FALSE and %TRUE.
  enum AccessibleTristate : UInt32
    # The state is `false`
    False = 0
    # The state is `true`
    True = 1
    # The state is `mixed`
    Mixed = 2
  end

  # Controls how a widget deals with extra space in a single dimension.
  #
  # Alignment only matters if the widget receives a “too large” allocation,
  # for example if you packed the widget with the `Gtk::Widget#hexpand`
  # property inside a `#Box`, then the widget might get extra space.
  # If you have for example a 16x16 icon inside a 32x32 space, the icon
  # could be scaled and stretched, it could be centered, or it could be
  # positioned to one side of the space.
  #
  # Note that in horizontal context %GTK_ALIGN_START and %GTK_ALIGN_END
  # are interpreted relative to text direction.
  #
  # %GTK_ALIGN_BASELINE support is optional for containers and widgets, and
  # it is only supported for vertical alignment.  When it's not supported by
  # a child or a container it is treated as %GTK_ALIGN_FILL.
  enum Align : UInt32
    # stretch to fill all space if possible, center if
    #   no meaningful way to stretch
    Fill = 0
    # snap to left or top side, leaving space on right or bottom
    Start = 1
    # snap to right or bottom side, leaving space on left or top
    End = 2
    # center natural width of widget inside the allocation
    Center = 3
    # align the widget according to the baseline.
    #   See `Gtk#Widget`.
    Baseline = 4
  end

  # Used to indicate the direction in which an arrow should point.
  enum ArrowType : UInt32
    # Represents an upward pointing arrow.
    Up = 0
    # Represents a downward pointing arrow.
    Down = 1
    # Represents a left pointing arrow.
    Left = 2
    # Represents a right pointing arrow.
    Right = 3
    # No arrow.
    None = 4
  end

  # Determines the page role inside a `GtkAssistant`.
  #
  # The role is used to handle buttons sensitivity and visibility.
  #
  # Note that an assistant needs to end its page flow with a page of type
  # %GTK_ASSISTANT_PAGE_CONFIRM, %GTK_ASSISTANT_PAGE_SUMMARY or
  # %GTK_ASSISTANT_PAGE_PROGRESS to be correct.
  #
  # The Cancel button will only be shown if the page isn’t “committed”.
  # See gtk_assistant_commit() for details.
  enum AssistantPageType : UInt32
    # The page has regular contents. Both the
    #  Back and forward buttons will be shown.
    Content = 0
    # The page contains an introduction to the
    #  assistant task. Only the Forward button will be shown if there is a
    #   next page.
    Intro = 1
    # The page lets the user confirm or deny the
    #  changes. The Back and Apply buttons will be shown.
    Confirm = 2
    # The page informs the user of the changes
    #  done. Only the Close button will be shown.
    Summary = 3
    # Used for tasks that take a long time to
    #  complete, blocks the assistant until the page is marked as complete.
    #   Only the back button will be shown.
    Progress = 4
    # Used for when other page types are not
    #  appropriate. No buttons will be shown, and the application must
    #  add its own buttons through gtk_assistant_add_action_widget().
    Custom = 5
  end

  # Baseline position in a row of widgets.
  #
  # Whenever a container has some form of natural row it may align
  # children in that row along a common typographical baseline. If
  # the amount of vertical space in the row is taller than the total
  # requested height of the baseline-aligned children then it can use a
  # `GtkBaselinePosition` to select where to put the baseline inside the
  # extra available space.
  enum BaselinePosition : UInt32
    # Align the baseline at the top
    Top = 0
    # Center the baseline
    Center = 1
    # Align the baseline at the bottom
    Bottom = 2
  end

  # Describes how the border of a UI element should be rendered.
  enum BorderStyle : UInt32
    # No visible border
    None = 0
    # Same as %GTK_BORDER_STYLE_NONE
    Hidden = 1
    # A single line segment
    Solid = 2
    # Looks as if the content is sunken into the canvas
    Inset = 3
    # Looks as if the content is coming out of the canvas
    Outset = 4
    # A series of round dots
    Dotted = 5
    # A series of square-ended dashes
    Dashed = 6
    # Two parallel lines with some space between them
    Double = 7
    # Looks as if it were carved in the canvas
    Groove = 8
    # Looks as if it were coming out of the canvas
    Ridge = 9
  end

  # Prebuilt sets of buttons for `GtkDialog`.
  #
  # If none of these choices are appropriate, simply use
  # %GTK_BUTTONS_NONE and call `Gtk::Dialog#add_buttons`.
  #
  # > Please note that %GTK_BUTTONS_OK, %GTK_BUTTONS_YES_NO
  # > and %GTK_BUTTONS_OK_CANCEL are discouraged by the
  # > [GNOME Human Interface Guidelines](http://library.gnome.org/devel/hig-book/stable/).
  enum ButtonsType : UInt32
    # no buttons at all
    None = 0
    # an OK button
    Ok = 1
    # a Close button
    Close = 2
    # a Cancel button
    Cancel = 3
    # Yes and No buttons
    YesNo = 4
    # OK and Cancel buttons
    OkCancel = 5
  end

  # The available modes for [property@Gtk.CellRendererAccel:accel-mode].
  enum CellRendererAccelMode : UInt32
    # GTK accelerators mode
    Gtk = 0
    # Other accelerator mode
    Other = 1
  end

  # Identifies how the user can interact with a particular cell.
  enum CellRendererMode : UInt32
    # The cell is just for display
    #  and cannot be interacted with.  Note that this doesn’t mean that eg. the
    #  row being drawn can’t be selected -- just that a particular element of
    #  it cannot be individually modified.
    Inert = 0
    # The cell can be clicked.
    Activatable = 1
    # The cell can be edited or otherwise modified.
    Editable = 2
  end

  # The widget attributes that can be used when creating a `#Constraint`.
  enum ConstraintAttribute : UInt32
    # No attribute, used for constant
    #   relations
    None = 0
    # The left edge of a widget, regardless of
    #   text direction
    Left = 1
    # The right edge of a widget, regardless
    #   of text direction
    Right = 2
    # The top edge of a widget
    Top = 3
    # The bottom edge of a widget
    Bottom = 4
    # The leading edge of a widget, depending
    #   on text direction; equivalent to %GTK_CONSTRAINT_ATTRIBUTE_LEFT for LTR
    #   languages, and %GTK_CONSTRAINT_ATTRIBUTE_RIGHT for RTL ones
    Start = 5
    # The trailing edge of a widget, depending
    #   on text direction; equivalent to %GTK_CONSTRAINT_ATTRIBUTE_RIGHT for LTR
    #   languages, and %GTK_CONSTRAINT_ATTRIBUTE_LEFT for RTL ones
    End = 6
    # The width of a widget
    Width = 7
    # The height of a widget
    Height = 8
    # The center of a widget, on the
    #   horizontal axis
    CenterX = 9
    # The center of a widget, on the
    #   vertical axis
    CenterY = 10
    # The baseline of a widget
    Baseline = 11
  end

  # The relation between two terms of a constraint.
  enum ConstraintRelation : Int32
    # Less than, or equal
    Le = -1
    # Equal
    Eq = 0
    # Greater than, or equal
    Ge = 1
  end

  # The strength of a constraint, expressed as a symbolic constant.
  #
  # The strength of a `#Constraint` can be expressed with any positive
  # integer; the values of this enumeration can be used for readability.
  enum ConstraintStrength : UInt32
    # The constraint is required towards solving the layout
    Required = 1001001000
    # A strong constraint
    Strong = 1000000000
    # A medium constraint
    Medium = 1000
    # A weak constraint
    Weak = 1
  end

  # Specifies which corner a child widget should be placed in when packed into
  # a `GtkScrolledWindow.`
  #
  # This is effectively the opposite of where the scroll bars are placed.
  enum CornerType : UInt32
    # Place the scrollbars on the right and bottom of the
    #   widget (default behaviour).
    TopLeft = 0
    # Place the scrollbars on the top and right of the
    #   widget.
    BottomLeft = 1
    # Place the scrollbars on the left and bottom of the
    #   widget.
    TopRight = 2
    # Place the scrollbars on the top and left of the
    #   widget.
    BottomRight = 3
  end

  # Warnings that can occur while parsing CSS.
  #
  # Unlike `GtkCssParserError`s, warnings do not cause the parser to
  # skip any input, but they indicate issues that should be fixed.
  enum CssParserWarning : UInt32
    # The given construct is
    #   deprecated and will be removed in a future version
    Deprecated = 0
    # A syntax construct was used
    #   that should be avoided
    Syntax = 1
    # A feature is not implemented
    Unimplemented = 2
  end

  # Passed to various keybinding signals for deleting text.
  enum DeleteType : UInt32
    # Delete characters.
    Chars = 0
    # Delete only the portion of the word to the
    #   left/right of cursor if we’re in the middle of a word.
    WordEnds = 1
    # Delete words.
    Words = 2
    # Delete display-lines. Display-lines
    #   refers to the visible lines, with respect to the current line
    #   breaks. As opposed to paragraphs, which are defined by line
    #   breaks in the input.
    DisplayLines = 3
    # Delete only the portion of the
    #   display-line to the left/right of cursor.
    DisplayLineEnds = 4
    # Delete to the end of the
    #   paragraph. Like C-k in Emacs (or its reverse).
    ParagraphEnds = 5
    # Delete entire line. Like C-k in pico.
    Paragraphs = 6
    # Delete only whitespace. Like M-\ in Emacs.
    Whitespace = 7
  end

  # Focus movement types.
  enum DirectionType : UInt32
    # Move forward.
    TabForward = 0
    # Move backward.
    TabBackward = 1
    # Move up.
    Up = 2
    # Move down.
    Down = 3
    # Move left.
    Left = 4
    # Move right.
    Right = 5
  end

  # The identifiers for `Gtk#Editable` properties.
  #
  # See `Gtk::Editable#install_properties` for details on how to
  # implement the `GtkEditable` interface.
  enum EditableProperties : UInt32
    # the property id for `Gtk::Editable#text`
    PropText = 0
    # the property id for [property@Gtk.Editable:cursor-position]
    PropCursorPosition = 1
    # the property id for [property@Gtk.Editable:selection-bound]
    PropSelectionBound = 2
    # the property id for `Gtk::Editable#editable`
    PropEditable = 3
    # the property id for [property@Gtk.Editable:width-chars]
    PropWidthChars = 4
    # the property id for [property@Gtk.Editable:max-width-chars]
    PropMaxWidthChars = 5
    # the property id for `Gtk::Editable#xalign`
    PropXalign = 6
    # the property id for [property@Gtk.Editable:enable-undo]
    PropEnableUndo = 7
    # the number of properties
    NumProperties = 8
  end

  # Specifies the side of the entry at which an icon is placed.
  enum EntryIconPosition : UInt32
    # At the beginning of the entry (depending on the text direction).
    Primary = 0
    # At the end of the entry (depending on the text direction).
    Secondary = 1
  end

  # Describes the state of a `Gdk#EventSequence` in a `#Gesture`.
  enum EventSequenceState : UInt32
    # The sequence is handled, but not grabbed.
    None = 0
    # The sequence is handled and grabbed.
    Claimed = 1
    # The sequence is denied.
    Denied = 2
  end

  # Describes whether a `GtkFileChooser` is being used to open existing files
  # or to save to a possibly new file.
  enum FileChooserAction : UInt32
    # Indicates open mode.  The file chooser
    #  will only let the user pick an existing file.
    Open = 0
    # Indicates save mode.  The file chooser
    #  will let the user pick an existing file, or type in a new
    #  filename.
    Save = 1
    # Indicates an Open mode for
    #  selecting folders.  The file chooser will let the user pick an
    #  existing folder.
    SelectFolder = 2
  end

  # Describes changes in a filter in more detail and allows objects
  # using the filter to optimize refiltering items.
  #
  # If you are writing an implementation and are not sure which
  # value to pass, %GTK_FILTER_CHANGE_DIFFERENT is always a correct
  # choice.
  enum FilterChange : UInt32
    # The filter change cannot be
    #   described with any of the other enumeration values.
    Different = 0
    # The filter is less strict than
    #   it was before: All items that it used to return %TRUE for
    #   still return %TRUE, others now may, too.
    LessStrict = 1
    # The filter is more strict than
    #   it was before: All items that it used to return %FALSE for
    #   still return %FALSE, others now may, too.
    MoreStrict = 2
  end

  # Describes the known strictness of a filter.
  #
  # Note that for filters where the strictness is not known,
  # %GTK_FILTER_MATCH_SOME is always an acceptable value,
  # even if a filter does match all or no items.
  enum FilterMatch : UInt32
    # The filter matches some items,
    #   gtk_filter_match() may return %TRUE or %FALSE
    Some = 0
    # The filter does not match any item,
    #   gtk_filter_match() will always return %FALSE.
    None = 1
    # The filter matches all items,
    #   gtk_filter_match() will alays return %TRUE.
    All = 2
  end

  # Built-in icon sizes.
  #
  # Icon sizes default to being inherited. Where they cannot be
  # inherited, text size is the default.
  #
  # All widgets which use `GtkIconSize` set the normal-icons or
  # large-icons style classes correspondingly, and let themes
  # determine the actual size to be used with the
  # `-gtk-icon-size` CSS property.
  enum IconSize : UInt32
    # Keep the size of the parent element
    Inherit = 0
    # Size similar to text size
    Normal = 1
    # Large size, for example in an icon view
    Large = 2
  end

  # An enum for determining where a dropped item goes.
  enum IconViewDropPosition : UInt32
    # no drop possible
    NoDrop = 0
    # dropped item replaces the item
    DropInto = 1
    # dropped item is inserted to the left
    DropLeft = 2
    # dropped item is inserted to the right
    DropRight = 3
    # dropped item is inserted above
    DropAbove = 4
    # dropped item is inserted below
    DropBelow = 5
  end

  # Describes the image data representation used by a `Gtk#Image`.
  #
  # If you want to get the image from the widget, you can only get the
  # currently-stored representation; for instance, if the gtk_image_get_storage_type()
  # returns %GTK_IMAGE_PAINTABLE, then you can call gtk_image_get_paintable().
  #
  # For empty images, you can request any storage type (call any of the "get"
  # functions), but they will all return %NULL values.
  enum ImageType : UInt32
    # there is no image displayed by the widget
    Empty = 0
    # the widget contains a named icon
    IconName = 1
    # the widget contains a `GIcon`
    Gicon = 2
    # the widget contains a `GdkPaintable`
    Paintable = 3
  end

  # Describes primary purpose of the input widget.
  #
  # This information is useful for on-screen keyboards and similar input
  # methods to decide which keys should be presented to the user.
  #
  # Note that the purpose is not meant to impose a totally strict rule
  # about allowed characters, and does not replace input validation.
  # It is fine for an on-screen keyboard to let the user override the
  # character set restriction that is expressed by the purpose. The
  # application is expected to validate the entry contents, even if
  # it specified a purpose.
  #
  # The difference between %GTK_INPUT_PURPOSE_DIGITS and
  # %GTK_INPUT_PURPOSE_NUMBER is that the former accepts only digits
  # while the latter also some punctuation (like commas or points, plus,
  # minus) and “e” or “E” as in 3.14E+000.
  #
  # This enumeration may be extended in the future; input methods should
  # interpret unknown values as “free form”.
  enum InputPurpose : UInt32
    # Allow any character
    FreeForm = 0
    # Allow only alphabetic characters
    Alpha = 1
    # Allow only digits
    Digits = 2
    # Edited field expects numbers
    Number = 3
    # Edited field expects phone number
    Phone = 4
    # Edited field expects URL
    Url = 5
    # Edited field expects email address
    Email = 6
    # Edited field expects the name of a person
    Name = 7
    # Like %GTK_INPUT_PURPOSE_FREE_FORM, but characters are hidden
    Password = 8
    # Like %GTK_INPUT_PURPOSE_DIGITS, but characters are hidden
    Pin = 9
    # Allow any character, in addition to control codes
    Terminal = 10
  end

  # Used for justifying the text inside a `#Label` widget.
  enum Justification : UInt32
    # The text is placed at the left edge of the label.
    Left = 0
    # The text is placed at the right edge of the label.
    Right = 1
    # The text is placed in the center of the label.
    Center = 2
    # The text is placed is distributed across the label.
    Fill = 3
  end

  # Describes how `#LevelBar` contents should be rendered.
  #
  # Note that this enumeration could be extended with additional modes
  # in the future.
  enum LevelBarMode : UInt32
    # the bar has a continuous mode
    Continuous = 0
    # the bar has a discrete mode
    Discrete = 1
  end

  # The type of license for an application.
  #
  # This enumeration can be expanded at later date.
  enum License : UInt32
    # No license specified
    Unknown = 0
    # A license text is going to be specified by the
    #   developer
    Custom = 1
    # The GNU General Public License, version 2.0 or later
    Gpl20 = 2
    # The GNU General Public License, version 3.0 or later
    Gpl30 = 3
    # The GNU Lesser General Public License, version 2.1 or later
    Lgpl21 = 4
    # The GNU Lesser General Public License, version 3.0 or later
    Lgpl30 = 5
    # The BSD standard license
    Bsd = 6
    # The MIT/X11 standard license
    MitX11 = 7
    # The Artistic License, version 2.0
    Artistic = 8
    # The GNU General Public License, version 2.0 only
    Gpl20Only = 9
    # The GNU General Public License, version 3.0 only
    Gpl30Only = 10
    # The GNU Lesser General Public License, version 2.1 only
    Lgpl21Only = 11
    # The GNU Lesser General Public License, version 3.0 only
    Lgpl30Only = 12
    # The GNU Affero General Public License, version 3.0 or later
    Agpl30 = 13
    # The GNU Affero General Public License, version 3.0 only
    Agpl30Only = 14
    # The 3-clause BSD licence
    Bsd3 = 15
    # The Apache License, version 2.0
    Apache20 = 16
    # The Mozilla Public License, version 2.0
    Mpl20 = 17
  end

  # The type of message being displayed in a `#MessageDialog`.
  enum MessageType : UInt32
    # Informational message
    Info = 0
    # Non-fatal warning message
    Warning = 1
    # Question requiring a choice
    Question = 2
    # Fatal error message
    Error = 3
    # None of the above
    Other = 4
  end

  # Passed as argument to various keybinding signals for moving the
  # cursor position.
  enum MovementStep : UInt32
    # Move forward or back by graphemes
    LogicalPositions = 0
    # Move left or right by graphemes
    VisualPositions = 1
    # Move forward or back by words
    Words = 2
    # Move up or down lines (wrapped lines)
    DisplayLines = 3
    # Move to either end of a line
    DisplayLineEnds = 4
    # Move up or down paragraphs (newline-ended lines)
    Paragraphs = 5
    # Move to either end of a paragraph
    ParagraphEnds = 6
    # Move by pages
    Pages = 7
    # Move to ends of the buffer
    BufferEnds = 8
    # Move horizontally by pages
    HorizontalPages = 9
  end

  # Options for selecting a different wrap mode for natural size
  # requests.
  #
  # See for example the [property@Gtk.Label:natural-wrap-mode] property.
  enum NaturalWrapMode : UInt32
    # Inherit the minimum size request.
    #   In particular, this should be used with %PANGO_WRAP_CHAR.
    Inherit = 0
    # Try not to wrap the text. This mode is the
    #   closest to GTK3's behavior but can lead to a wide label leaving
    #   lots of empty space below the text.
    None = 1
    # Attempt to wrap at word boundaries. This
    #   is useful in particular when using %PANGO_WRAP_WORD_CHAR as the
    #   wrap mode.
    Word = 2
  end

  # The parameter used in the action signals of `GtkNotebook`.
  enum NotebookTab : UInt32
    # the first tab in the notebook
    First = 0
    # the last tab in the notebook
    Last = 1
  end

  # Used to determine the layout of pages on a sheet when printing
  # multiple pages per sheet.
  enum NumberUpLayout : UInt32
    # ![](layout-lrtb.png)
    Lrtb = 0
    # ![](layout-lrbt.png)
    Lrbt = 1
    # ![](layout-rltb.png)
    Rltb = 2
    # ![](layout-rlbt.png)
    Rlbt = 3
    # ![](layout-tblr.png)
    Tblr = 4
    # ![](layout-tbrl.png)
    Tbrl = 5
    # ![](layout-btlr.png)
    Btlr = 6
    # ![](layout-btrl.png)
    Btrl = 7
  end

  # Describes the way two values can be compared.
  #
  # These values can be used with a `GLib#CompareFunc`. However,
  # a `GCompareFunc` is allowed to return any integer values.
  # For converting such a value to a `GtkOrdering` value, use
  # `Gtk::Ordering#from_cmpfunc`.
  enum Ordering : Int32
    # the first value is smaller than the second
    Smaller = -1
    # the two values are equal
    Equal = 0
    # the first value is larger than the second
    Larger = 1
  end

  # Represents the orientation of widgets and other objects.
  #
  # Typical examples are `#Box` or `#GesturePan`.
  enum Orientation : UInt32
    # The element is in horizontal orientation.
    Horizontal = 0
    # The element is in vertical orientation.
    Vertical = 1
  end

  # Defines how content overflowing a given area should be handled.
  #
  # This is used in `Gtk::Widget#overflow=`. The
  # `Gtk::Widget#overflow` property is modeled after the
  # CSS overflow property, but implements it only partially.
  enum Overflow : UInt32
    # No change is applied. Content is drawn at the specified
    #   position.
    Visible = 0
    # Content is clipped to the bounds of the area. Content
    #   outside the area is not drawn and cannot be interacted with.
    Hidden = 1
  end

  # Represents the packing location of a children in its parent.
  #
  # See `#WindowControls` for example.
  enum PackType : UInt32
    # The child is packed into the start of the widget
    Start = 0
    # The child is packed into the end of the widget
    End = 1
  end

  # The type of a pad action.
  enum PadActionType : UInt32
    # Action is triggered by a pad button
    Button = 0
    # Action is triggered by a pad ring
    Ring = 1
    # Action is triggered by a pad strip
    Strip = 2
  end

  # See also gtk_print_settings_set_orientation().
  enum PageOrientation : UInt32
    # Portrait mode.
    Portrait = 0
    # Landscape mode.
    Landscape = 1
    # Reverse portrait mode.
    ReversePortrait = 2
    # Reverse landscape mode.
    ReverseLandscape = 3
  end

  # See also gtk_print_job_set_page_set().
  enum PageSet : UInt32
    # All pages.
    All = 0
    # Even pages.
    Even = 1
    # Odd pages.
    Odd = 2
  end

  # Describes the panning direction of a `#GesturePan`.
  enum PanDirection : UInt32
    # panned towards the left
    Left = 0
    # panned towards the right
    Right = 1
    # panned upwards
    Up = 2
    # panned downwards
    Down = 3
  end

  # Determines how the size should be computed to achieve the one of the
  # visibility mode for the scrollbars.
  enum PolicyType : UInt32
    # The scrollbar is always visible. The view size is
    #   independent of the content.
    Always = 0
    # The scrollbar will appear and disappear as necessary.
    #   For example, when all of a `GtkTreeView` can not be seen.
    Automatic = 1
    # The scrollbar should never appear. In this mode the
    #   content determines the size.
    Never = 2
    # Don't show a scrollbar, but don't force the
    #   size to follow the content. This can be used e.g. to make multiple
    #   scrolled windows share a scrollbar.
    External = 3
  end

  # Describes which edge of a widget a certain feature is positioned at.
  #
  # For examples, see the tabs of a `#Notebook`, or the label
  # of a `#Scale`.
  enum PositionType : UInt32
    # The feature is at the left edge.
    Left = 0
    # The feature is at the right edge.
    Right = 1
    # The feature is at the top edge.
    Top = 2
    # The feature is at the bottom edge.
    Bottom = 3
  end

  # See also gtk_print_settings_set_duplex().
  enum PrintDuplex : UInt32
    # No duplex.
    Simplex = 0
    # Horizontal duplex.
    Horizontal = 1
    # Vertical duplex.
    Vertical = 2
  end

  # Determines what action the print operation should perform.
  #
  # A parameter of this typs is passed to `Gtk::PrintOperation#run`.
  enum PrintOperationAction : UInt32
    # Show the print dialog.
    PrintDialog = 0
    # Start to print without showing
    #   the print dialog, based on the current print settings.
    Print = 1
    # Show the print preview.
    Preview = 2
    # Export to a file. This requires
    #   the export-filename property to be set.
    Export = 3
  end

  # The result of a print operation.
  #
  # A value of this type is returned by `Gtk::PrintOperation#run`.
  enum PrintOperationResult : UInt32
    # An error has occurred.
    Error = 0
    # The print settings should be stored.
    Apply = 1
    # The print operation has been canceled,
    #   the print settings should not be stored.
    Cancel = 2
    # The print operation is not complete
    #   yet. This value will only be returned when running asynchronously.
    InProgress = 3
  end

  # See also gtk_print_job_set_pages()
  enum PrintPages : UInt32
    # All pages.
    All = 0
    # Current page.
    Current = 1
    # Range of pages.
    Ranges = 2
    # Selected pages.
    Selection = 3
  end

  # See also gtk_print_settings_set_quality().
  enum PrintQuality : UInt32
    # Low quality.
    Low = 0
    # Normal quality.
    Normal = 1
    # High quality.
    High = 2
    # Draft quality.
    Draft = 3
  end

  # The status gives a rough indication of the completion of a running
  # print operation.
  enum PrintStatus : UInt32
    # The printing has not started yet; this
    #   status is set initially, and while the print dialog is shown.
    Initial = 0
    # This status is set while the begin-print
    #   signal is emitted and during pagination.
    Preparing = 1
    # This status is set while the
    #   pages are being rendered.
    GeneratingData = 2
    # The print job is being sent off to the
    #   printer.
    SendingData = 3
    # The print job has been sent to the printer,
    #   but is not printed for some reason, e.g. the printer may be stopped.
    Pending = 4
    # Some problem has occurred during
    #   printing, e.g. a paper jam.
    PendingIssue = 5
    # The printer is processing the print job.
    Printing = 6
    # The printing has been completed successfully.
    Finished = 7
    # The printing has been aborted.
    FinishedAborted = 8
  end

  # Describes limits of a `#EventController` for handling events
  # targeting other widgets.
  enum PropagationLimit : UInt32
    # Events are handled regardless of what their
    #   target is.
    None = 0
    # Events are only handled if their target
    #   is in the same `#Native` as the event controllers widget. Note
    #   that some event types have two targets (origin and destination).
    SameNative = 1
  end

  # Describes the stage at which events are fed into a `#EventController`.
  enum PropagationPhase : UInt32
    # Events are not delivered.
    None = 0
    # Events are delivered in the capture phase. The
    #   capture phase happens before the bubble phase, runs from the toplevel down
    #   to the event widget. This option should only be used on containers that
    #   might possibly handle events before their children do.
    Capture = 1
    # Events are delivered in the bubble phase. The bubble
    #   phase happens after the capture phase, and before the default handlers
    #   are run. This phase runs from the event widget, up to the toplevel.
    Bubble = 2
    # Events are delivered in the default widget event handlers,
    #   note that widget implementations must chain up on button, motion, touch and
    #   grab broken handlers for controllers in this phase to be run.
    Target = 3
  end

  # Predefined values for use as response ids in gtk_dialog_add_button().
  #
  # All predefined values are negative; GTK leaves values of 0 or greater for
  # application-defined response ids.
  enum ResponseType : Int32
    # Returned if an action widget has no response id,
    #   or if the dialog gets programmatically hidden or destroyed
    None = -1
    # Generic response id, not used by GTK dialogs
    Reject = -2
    # Generic response id, not used by GTK dialogs
    Accept = -3
    # Returned if the dialog is deleted
    DeleteEvent = -4
    # Returned by OK buttons in GTK dialogs
    Ok = -5
    # Returned by Cancel buttons in GTK dialogs
    Cancel = -6
    # Returned by Close buttons in GTK dialogs
    Close = -7
    # Returned by Yes buttons in GTK dialogs
    Yes = -8
    # Returned by No buttons in GTK dialogs
    No = -9
    # Returned by Apply buttons in GTK dialogs
    Apply = -10
    # Returned by Help buttons in GTK dialogs
    Help = -11
  end

  # These enumeration values describe the possible transitions
  # when the child of a `GtkRevealer` widget is shown or hidden.
  enum RevealerTransitionType : UInt32
    # No transition
    None = 0
    # Fade in
    Crossfade = 1
    # Slide in from the left
    SlideRight = 2
    # Slide in from the right
    SlideLeft = 3
    # Slide in from the bottom
    SlideUp = 4
    # Slide in from the top
    SlideDown = 5
    # Floop in from the left
    SwingRight = 6
    # Floop in from the right
    SwingLeft = 7
    # Floop in from the bottom
    SwingUp = 8
    # Floop in from the top
    SwingDown = 9
  end

  # Passed as argument to various keybinding signals.
  enum ScrollStep : UInt32
    # Scroll in steps.
    Steps = 0
    # Scroll by pages.
    Pages = 1
    # Scroll to ends.
    Ends = 2
    # Scroll in horizontal steps.
    HorizontalSteps = 3
    # Scroll by horizontal pages.
    HorizontalPages = 4
    # Scroll to the horizontal ends.
    HorizontalEnds = 5
  end

  # Scrolling types.
  enum ScrollType : UInt32
    # No scrolling.
    None = 0
    # Jump to new location.
    Jump = 1
    # Step backward.
    StepBackward = 2
    # Step forward.
    StepForward = 3
    # Page backward.
    PageBackward = 4
    # Page forward.
    PageForward = 5
    # Step up.
    StepUp = 6
    # Step down.
    StepDown = 7
    # Page up.
    PageUp = 8
    # Page down.
    PageDown = 9
    # Step to the left.
    StepLeft = 10
    # Step to the right.
    StepRight = 11
    # Page to the left.
    PageLeft = 12
    # Page to the right.
    PageRight = 13
    # Scroll to start.
    Start = 14
    # Scroll to end.
    End = 15
  end

  # Defines the policy to be used in a scrollable widget when updating
  # the scrolled window adjustments in a given orientation.
  enum ScrollablePolicy : UInt32
    # Scrollable adjustments are based on the minimum size
    Minimum = 0
    # Scrollable adjustments are based on the natural size
    Natural = 1
  end

  # Used to control what selections users are allowed to make.
  enum SelectionMode : UInt32
    # No selection is possible.
    None = 0
    # Zero or one element may be selected.
    Single = 1
    # Exactly one element is selected.
    #   In some circumstances, such as initially or during a search
    #   operation, it’s possible for no element to be selected with
    #   %GTK_SELECTION_BROWSE. What is really enforced is that the user
    #   can’t deselect a currently selected element except by selecting
    #   another element.
    Browse = 2
    # Any number of elements may be selected.
    #   The Ctrl key may be used to enlarge the selection, and Shift
    #   key to select between the focus and the child pointed to.
    #   Some widgets may also allow Click-drag to select a range of elements.
    Multiple = 3
  end

  # Determines how GTK handles the sensitivity of various controls,
  # such as combo box buttons.
  enum SensitivityType : UInt32
    # The control is made insensitive if no
    #   action can be triggered
    Auto = 0
    # The control is always sensitive
    On = 1
    # The control is always insensitive
    Off = 2
  end

  # Describes where `#Shortcut`s added to a
  # `#ShortcutController` get handled.
  enum ShortcutScope : UInt32
    # Shortcuts are handled inside
    #   the widget the controller belongs to.
    Local = 0
    # Shortcuts are handled by
    #   the first ancestor that is a `#ShortcutManager`
    Managed = 1
    # Shortcuts are handled by
    #   the root widget.
    Global = 2
  end

  # GtkShortcutType specifies the kind of shortcut that is being described.
  #
  # More values may be added to this enumeration over time.
  enum ShortcutType : UInt32
    # The shortcut is a keyboard accelerator. The GtkShortcutsShortcut:accelerator
    #   property will be used.
    Accelerator = 0
    # The shortcut is a pinch gesture. GTK provides an icon and subtitle.
    GesturePinch = 1
    # The shortcut is a stretch gesture. GTK provides an icon and subtitle.
    GestureStretch = 2
    # The shortcut is a clockwise rotation gesture. GTK provides an icon and subtitle.
    GestureRotateClockwise = 3
    # The shortcut is a counterclockwise rotation gesture. GTK provides an icon and subtitle.
    GestureRotateCounterclockwise = 4
    # The shortcut is a two-finger swipe gesture. GTK provides an icon and subtitle.
    GestureTwoFingerSwipeLeft = 5
    # The shortcut is a two-finger swipe gesture. GTK provides an icon and subtitle.
    GestureTwoFingerSwipeRight = 6
    # The shortcut is a gesture. The GtkShortcutsShortcut:icon property will be
    #   used.
    Gesture = 7
    # The shortcut is a swipe gesture. GTK provides an icon and subtitle.
    GestureSwipeLeft = 8
    # The shortcut is a swipe gesture. GTK provides an icon and subtitle.
    GestureSwipeRight = 9
  end

  # The mode of the size group determines the directions in which the size
  # group affects the requested sizes of its component widgets.
  enum SizeGroupMode : UInt32
    # group has no effect
    None = 0
    # group affects horizontal requisition
    Horizontal = 1
    # group affects vertical requisition
    Vertical = 2
    # group affects both horizontal and vertical requisition
    Both = 3
  end

  # Specifies a preference for height-for-width or
  # width-for-height geometry management.
  enum SizeRequestMode : UInt32
    # Prefer height-for-width geometry management
    HeightForWidth = 0
    # Prefer width-for-height geometry management
    WidthForHeight = 1
    # Don’t trade height-for-width or width-for-height
    ConstantSize = 2
  end

  # Determines the direction of a sort.
  enum SortType : UInt32
    # Sorting is in ascending order.
    Ascending = 0
    # Sorting is in descending order.
    Descending = 1
  end

  # Describes changes in a sorter in more detail and allows users
  # to optimize resorting.
  enum SorterChange : UInt32
    # The sorter change cannot be described
    #   by any of the other enumeration values
    Different = 0
    # The sort order was inverted. Comparisons
    #   that returned %GTK_ORDERING_SMALLER now return %GTK_ORDERING_LARGER
    #   and vice versa. Other comparisons return the same values as before.
    Inverted = 1
    # The sorter is less strict: Comparisons
    #   may now return %GTK_ORDERING_EQUAL that did not do so before.
    LessStrict = 2
    # The sorter is more strict: Comparisons
    #   that did return %GTK_ORDERING_EQUAL may not do so anymore.
    MoreStrict = 3
  end

  # Describes the type of order that a `GtkSorter` may produce.
  enum SorterOrder : UInt32
    # A partial order. Any `GtkOrdering` is possible.
    Partial = 0
    # No order, all elements are considered equal.
    #   gtk_sorter_compare() will only return %GTK_ORDERING_EQUAL.
    None = 1
    # A total order. gtk_sorter_compare() will only
    #   return %GTK_ORDERING_EQUAL if an item is compared with itself. Two
    #   different items will never cause this value to be returned.
    Total = 2
  end

  # Determines whether the spin button displays values outside the adjustment
  # bounds.
  #
  # See `Gtk::SpinButton#update_policy=`.
  enum SpinButtonUpdatePolicy : UInt32
    # When refreshing your `GtkSpinButton`, the value is
    #   always displayed
    Always = 0
    # When refreshing your `GtkSpinButton`, the value is
    #   only displayed if it is valid within the bounds of the spin button's
    #   adjustment
    IfValid = 1
  end

  # The values of the GtkSpinType enumeration are used to specify the
  # change to make in gtk_spin_button_spin().
  enum SpinType : UInt32
    # Increment by the adjustments step increment.
    StepForward = 0
    # Decrement by the adjustments step increment.
    StepBackward = 1
    # Increment by the adjustments page increment.
    PageForward = 2
    # Decrement by the adjustments page increment.
    PageBackward = 3
    # Go to the adjustments lower bound.
    Home = 4
    # Go to the adjustments upper bound.
    End = 5
    # Change by a specified amount.
    UserDefined = 6
  end

  # Possible transitions between pages in a `GtkStack` widget.
  #
  # New values may be added to this enumeration over time.
  enum StackTransitionType : UInt32
    # No transition
    None = 0
    # A cross-fade
    Crossfade = 1
    # Slide from left to right
    SlideRight = 2
    # Slide from right to left
    SlideLeft = 3
    # Slide from bottom up
    SlideUp = 4
    # Slide from top down
    SlideDown = 5
    # Slide from left or right according to the children order
    SlideLeftRight = 6
    # Slide from top down or bottom up according to the order
    SlideUpDown = 7
    # Cover the old page by sliding up
    OverUp = 8
    # Cover the old page by sliding down
    OverDown = 9
    # Cover the old page by sliding to the left
    OverLeft = 10
    # Cover the old page by sliding to the right
    OverRight = 11
    # Uncover the new page by sliding up
    UnderUp = 12
    # Uncover the new page by sliding down
    UnderDown = 13
    # Uncover the new page by sliding to the left
    UnderLeft = 14
    # Uncover the new page by sliding to the right
    UnderRight = 15
    # Cover the old page sliding up or uncover the new page sliding down, according to order
    OverUpDown = 16
    # Cover the old page sliding down or uncover the new page sliding up, according to order
    OverDownUp = 17
    # Cover the old page sliding left or uncover the new page sliding right, according to order
    OverLeftRight = 18
    # Cover the old page sliding right or uncover the new page sliding left, according to order
    OverRightLeft = 19
    # Pretend the pages are sides of a cube and rotate that cube to the left
    RotateLeft = 20
    # Pretend the pages are sides of a cube and rotate that cube to the right
    RotateRight = 21
    # Pretend the pages are sides of a cube and rotate that cube to the left or right according to the children order
    RotateLeftRight = 22
  end

  # Specifies how search strings are matched inside text.
  enum StringFilterMatchMode : UInt32
    # The search string and
    #   text must match exactly.
    Exact = 0
    # The search string
    #   must be contained as a substring inside the text.
    Substring = 1
    # The text must begin
    #   with the search string.
    Prefix = 2
  end

  # The indexes of colors passed to symbolic color rendering, such as
  # `Gtk::SymbolicPaintable#snapshot_symbolic`.
  #
  # More values may be added over time.
  enum SymbolicColor : UInt32
    # The default foreground color
    Foreground = 0
    # Indication color for errors
    Error = 1
    # Indication color for warnings
    Warning = 2
    # Indication color for success
    Success = 3
  end

  # Values that can be passed to the `Gtk::Widget#system_setting_changed`
  # vfunc.
  #
  # The values indicate which system setting has changed.
  # Widgets may need to drop caches, or react otherwise.
  #
  # Most of the values correspond to `#Settings` properties.
  #
  # More values may be added over time.
  enum SystemSetting : UInt32
    # the [property@Gtk.Settings:gtk-xft-dpi] setting has changed
    Dpi = 0
    # The [property@Gtk.Settings:gtk-font-name] setting has changed
    FontName = 1
    # The font configuration has changed in a way that
    #   requires text to be redrawn. This can be any of the
    #   [property@Gtk.Settings:gtk-xft-antialias],
    #   [property@Gtk.Settings:gtk-xft-hinting],
    #   [property@Gtk.Settings:gtk-xft-hintstyle],
    #   [property@Gtk.Settings:gtk-xft-rgba] or
    #   [property@Gtk.Settings:gtk-fontconfig-timestamp] settings
    FontConfig = 2
    # The display has changed
    Display = 3
    # The icon theme has changed in a way that requires
    #   icons to be looked up again
    IconTheme = 4
  end

  # Reading directions for text.
  enum TextDirection : UInt32
    # No direction.
    None = 0
    # Left to right text direction.
    Ltr = 1
    # Right to left text direction.
    Rtl = 2
  end

  # Granularity types that extend the text selection. Use the
  # `GtkTextView::extend-selection` signal to customize the selection.
  enum TextExtendSelection : UInt32
    # Selects the current word. It is triggered by
    #   a double-click for example.
    Word = 0
    # Selects the current line. It is triggered by
    #   a triple-click for example.
    Line = 1
  end

  # Used to reference the layers of `GtkTextView` for the purpose of customized
  # drawing with the ::snapshot_layer vfunc.
  enum TextViewLayer : UInt32
    # The layer rendered below the text (but above the background).
    BelowText = 0
    # The layer rendered above the text.
    AboveText = 1
  end

  # Used to reference the parts of `GtkTextView`.
  enum TextWindowType : UInt32
    # Window that floats over scrolling areas.
    Widget = 1
    # Scrollable text window.
    Text = 2
    # Left side border window.
    Left = 3
    # Right side border window.
    Right = 4
    # Top border window.
    Top = 5
    # Bottom border window.
    Bottom = 6
  end

  # The sizing method the column uses to determine its width.  Please note
  # that %GTK_TREE_VIEW_COLUMN_AUTOSIZE are inefficient for large views, and
  # can make columns appear choppy.
  enum TreeViewColumnSizing : UInt32
    # Columns only get bigger in reaction to changes in the model
    GrowOnly = 0
    # Columns resize to be the optimal size every time the model changes.
    Autosize = 1
    # Columns are a fixed numbers of pixels wide.
    Fixed = 2
  end

  # An enum for determining where a dropped row goes.
  enum TreeViewDropPosition : UInt32
    # dropped row is inserted before
    Before = 0
    # dropped row is inserted after
    After = 1
    # dropped row becomes a child or is inserted before
    IntoOrBefore = 2
    # dropped row becomes a child or is inserted after
    IntoOrAfter = 3
  end

  # Used to indicate which grid lines to draw in a tree view.
  enum TreeViewGridLines : UInt32
    # No grid lines.
    None = 0
    # Horizontal grid lines.
    Horizontal = 1
    # Vertical grid lines.
    Vertical = 2
    # Horizontal and vertical grid lines.
    Both = 3
  end

  # See also gtk_print_settings_set_paper_width().
  enum Unit : UInt32
    # No units.
    None = 0
    # Dimensions in points.
    Points = 1
    # Dimensions in inches.
    Inch = 2
    # Dimensions in millimeters
    Mm = 3
  end

  # Describes a type of line wrapping.
  enum WrapMode : UInt32
    # do not wrap lines; just make the text area wider
    None = 0
    # wrap text, breaking lines anywhere the cursor can
    #   appear (between characters, usually - if you want to be technical,
    #   between graphemes, see pango_get_log_attrs())
    Char = 1
    # wrap text, breaking lines in between words
    Word = 2
    # wrap text, breaking lines in between words, or if
    #   that is not enough, also between graphemes
    WordChar = 3
  end

  # Flags
  @[Flags]
  enum ApplicationInhibitFlags : UInt32
    Logout  = 1
    Switch  = 2
    Suspend = 4
    Idle    = 8

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_application_inhibit_flags_get_type
    end
  end
  @[Flags]
  enum BuilderClosureFlags : UInt32
    Swapped = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_builder_closure_flags_get_type
    end
  end
  @[Flags]
  enum CellRendererState : UInt32
    Selected    =  1
    Prelit      =  2
    Insensitive =  4
    Sorted      =  8
    Focused     = 16
    Expandable  = 32
    Expanded    = 64

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_renderer_state_get_type
    end
  end
  @[Flags]
  enum DebugFlags : UInt32
    Text           =      1
    Tree           =      2
    Keybindings    =      4
    Modules        =      8
    Geometry       =     16
    Icontheme      =     32
    Printing       =     64
    Builder        =    128
    SizeRequest    =    256
    NoCssCache     =    512
    Interactive    =   1024
    Touchscreen    =   2048
    Actions        =   4096
    Layout         =   8192
    Snapshot       =  16384
    Constraints    =  32768
    BuilderObjects =  65536
    A11y           = 131072
    Iconfallback   = 262144

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_debug_flags_get_type
    end
  end
  @[Flags]
  enum DialogFlags : UInt32
    Modal             = 1
    DestroyWithParent = 2
    UseHeaderBar      = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_dialog_flags_get_type
    end
  end
  @[Flags]
  enum EventControllerScrollFlags : UInt32
    Vertical   = 1
    Horizontal = 2
    Discrete   = 4
    Kinetic    = 8
    BothAxes   = 3

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_event_controller_scroll_flags_get_type
    end
  end
  @[Flags]
  enum FontChooserLevel : UInt32
    Family     = 0
    Style      = 1
    Size       = 2
    Variations = 4
    Features   = 8

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_font_chooser_level_get_type
    end
  end
  @[Flags]
  enum IconLookupFlags : UInt32
    ForceRegular  = 1
    ForceSymbolic = 2
    Preload       = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_icon_lookup_flags_get_type
    end
  end
  @[Flags]
  enum InputHints : UInt32
    Spellcheck         =    1
    NoSpellcheck       =    2
    WordCompletion     =    4
    Lowercase          =    8
    UppercaseChars     =   16
    UppercaseWords     =   32
    UppercaseSentences =   64
    InhibitOsk         =  128
    VerticalWriting    =  256
    Emoji              =  512
    NoEmoji            = 1024
    Private            = 2048

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_input_hints_get_type
    end
  end
  @[Flags]
  enum PickFlags : UInt32
    Default       = 0
    Insensitive   = 1
    NonTargetable = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_pick_flags_get_type
    end
  end
  @[Flags]
  enum PopoverMenuFlags : UInt32
    Nested = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_popover_menu_flags_get_type
    end
  end
  @[Flags]
  enum PrintCapabilities : UInt32
    PageSet        =   1
    Copies         =   2
    Collate        =   4
    Reverse        =   8
    Scale          =  16
    GeneratePdf    =  32
    GeneratePs     =  64
    Preview        = 128
    NumberUp       = 256
    NumberUpLayout = 512

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_print_capabilities_get_type
    end
  end
  @[Flags]
  enum ShortcutActionFlags : UInt32
    Exclusive = 1

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_shortcut_action_flags_get_type
    end
  end
  @[Flags]
  enum StateFlags : UInt32
    Normal       =     0
    Active       =     1
    Prelight     =     2
    Selected     =     4
    Insensitive  =     8
    Inconsistent =    16
    Focused      =    32
    Backdrop     =    64
    DirLtr       =   128
    DirRtl       =   256
    Link         =   512
    Visited      =  1024
    Checked      =  2048
    DropActive   =  4096
    FocusVisible =  8192
    FocusWithin  = 16384

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_state_flags_get_type
    end
  end
  @[Flags]
  enum StyleContextPrintFlags : UInt32
    Recurse    = 1
    ShowStyle  = 2
    ShowChange = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_style_context_print_flags_get_type
    end
  end
  @[Flags]
  enum TextSearchFlags : UInt32
    VisibleOnly     = 1
    TextOnly        = 2
    CaseInsensitive = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_text_search_flags_get_type
    end
  end
  @[Flags]
  enum TreeModelFlags : UInt32
    ItersPersist = 1
    ListOnly     = 2

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_model_flags_get_type
    end
  end

  def self.accelerator_get_default_mod_mask : Gdk::ModifierType
    # gtk_accelerator_get_default_mod_mask: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_accelerator_get_default_mod_mask

    # Return value handling

    Gdk::ModifierType.new(_retval)
  end

  def self.accelerator_get_label(accelerator_key : UInt32, accelerator_mods : Gdk::ModifierType) : ::String
    # gtk_accelerator_get_label: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGtk.gtk_accelerator_get_label(accelerator_key, accelerator_mods)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.accelerator_get_label_with_keycode(display : Gdk::Display?, accelerator_key : UInt32, keycode : UInt32, accelerator_mods : Gdk::ModifierType) : ::String
    # gtk_accelerator_get_label_with_keycode: (None)
    # @display: (nullable)
    # Returns: (transfer full)

    # Generator::NullableArrayPlan
    display = if display.nil?
                Pointer(Void).null
              else
                display.to_unsafe
              end

    # C call
    _retval = LibGtk.gtk_accelerator_get_label_with_keycode(display, accelerator_key, keycode, accelerator_mods)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.accelerator_name(accelerator_key : UInt32, accelerator_mods : Gdk::ModifierType) : ::String
    # gtk_accelerator_name: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGtk.gtk_accelerator_name(accelerator_key, accelerator_mods)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.accelerator_name_with_keycode(display : Gdk::Display?, accelerator_key : UInt32, keycode : UInt32, accelerator_mods : Gdk::ModifierType) : ::String
    # gtk_accelerator_name_with_keycode: (None)
    # @display: (nullable)
    # Returns: (transfer full)

    # Generator::NullableArrayPlan
    display = if display.nil?
                Pointer(Void).null
              else
                display.to_unsafe
              end

    # C call
    _retval = LibGtk.gtk_accelerator_name_with_keycode(display, accelerator_key, keycode, accelerator_mods)

    # Return value handling

    GICrystal.transfer_full(_retval)
  end

  def self.accelerator_parse(accelerator : ::String) : Bool
    # gtk_accelerator_parse: (None)
    # @accelerator_key: (out) (transfer full) (optional)
    # @accelerator_mods: (out) (transfer full) (optional)
    # Returns: (transfer none)

    # Generator::OutArgUsedInReturnPlan
    accelerator_key = Pointer(UInt32).null # Generator::OutArgUsedInReturnPlan
    accelerator_mods = Pointer(UInt32).null
    # C call
    _retval = LibGtk.gtk_accelerator_parse(accelerator, accelerator_key, accelerator_mods)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.accelerator_parse_with_keycode(accelerator : ::String, display : Gdk::Display?) : Bool
    # gtk_accelerator_parse_with_keycode: (None)
    # @display: (nullable)
    # @accelerator_key: (out) (transfer full) (optional)
    # @accelerator_codes: (out) (transfer full) (optional) (array zero-terminated=1 element-type UInt32)
    # @accelerator_mods: (out) (transfer full) (optional)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    display = if display.nil?
                Pointer(Void).null
              else
                display.to_unsafe
              end
    # Generator::OutArgUsedInReturnPlan
    accelerator_key = Pointer(UInt32).null            # Generator::OutArgUsedInReturnPlan
    accelerator_codes = Pointer(Pointer(UInt32)).null # Generator::ArrayArgPlan
    accelerator_codes = accelerator_codes.to_a.to_unsafe
    # Generator::OutArgUsedInReturnPlan
    accelerator_mods = Pointer(UInt32).null
    # C call
    _retval = LibGtk.gtk_accelerator_parse_with_keycode(accelerator, display, accelerator_key, accelerator_codes, accelerator_mods)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.accelerator_valid(keyval : UInt32, modifiers : Gdk::ModifierType) : Bool
    # gtk_accelerator_valid: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_accelerator_valid(keyval, modifiers)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.accessible_property_init_value(property : Gtk::AccessibleProperty, value : _) : Nil
    # gtk_accessible_property_init_value: (None)
    # Returns: (transfer none)

    # Generator::HandmadeArgPlan
    value = if !value.is_a?(GObject::Value)
              GObject::Value.new(value).to_unsafe
            else
              value.to_unsafe
            end

    # C call
    LibGtk.gtk_accessible_property_init_value(property, value)

    # Return value handling
  end

  def self.accessible_relation_init_value(relation : Gtk::AccessibleRelation, value : _) : Nil
    # gtk_accessible_relation_init_value: (None)
    # Returns: (transfer none)

    # Generator::HandmadeArgPlan
    value = if !value.is_a?(GObject::Value)
              GObject::Value.new(value).to_unsafe
            else
              value.to_unsafe
            end

    # C call
    LibGtk.gtk_accessible_relation_init_value(relation, value)

    # Return value handling
  end

  def self.accessible_state_init_value(state : Gtk::AccessibleState, value : _) : Nil
    # gtk_accessible_state_init_value: (None)
    # Returns: (transfer none)

    # Generator::HandmadeArgPlan
    value = if !value.is_a?(GObject::Value)
              GObject::Value.new(value).to_unsafe
            else
              value.to_unsafe
            end

    # C call
    LibGtk.gtk_accessible_state_init_value(state, value)

    # Return value handling
  end

  def self.bitset_iter_init_at(set : Gtk::Bitset, target : UInt32) : Gtk::BitsetIter
    # gtk_bitset_iter_init_at: (None)
    # @iter: (out) (caller-allocates)
    # @value: (out) (transfer full) (optional)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    iter = Gtk::BitsetIter.new # Generator::OutArgUsedInReturnPlan
    value = Pointer(UInt32).null
    # C call
    _retval = LibGtk.gtk_bitset_iter_init_at(iter, set, target, value)

    # Return value handling

    iter
  end

  def self.bitset_iter_init_first(set : Gtk::Bitset) : Gtk::BitsetIter
    # gtk_bitset_iter_init_first: (None)
    # @iter: (out) (caller-allocates)
    # @value: (out) (transfer full) (optional)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    iter = Gtk::BitsetIter.new # Generator::OutArgUsedInReturnPlan
    value = Pointer(UInt32).null
    # C call
    _retval = LibGtk.gtk_bitset_iter_init_first(iter, set, value)

    # Return value handling

    iter
  end

  def self.bitset_iter_init_last(set : Gtk::Bitset) : Gtk::BitsetIter
    # gtk_bitset_iter_init_last: (None)
    # @iter: (out) (caller-allocates)
    # @value: (out) (transfer full) (optional)
    # Returns: (transfer none)

    # Generator::CallerAllocatesPlan
    iter = Gtk::BitsetIter.new # Generator::OutArgUsedInReturnPlan
    value = Pointer(UInt32).null
    # C call
    _retval = LibGtk.gtk_bitset_iter_init_last(iter, set, value)

    # Return value handling

    iter
  end

  def self.builder_error_quark : UInt32
    # gtk_builder_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_builder_error_quark

    # Return value handling

    _retval
  end

  def self.check_version(required_major : UInt32, required_minor : UInt32, required_micro : UInt32) : ::String?
    # gtk_check_version: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_check_version(required_major, required_minor, required_micro)

    # Return value handling

    ::String.new(_retval) unless _retval.null?
  end

  def self.constraint_vfl_parser_error_quark : UInt32
    # gtk_constraint_vfl_parser_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_constraint_vfl_parser_error_quark

    # Return value handling

    _retval
  end

  def self.css_parser_error_quark : UInt32
    # gtk_css_parser_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_css_parser_error_quark

    # Return value handling

    _retval
  end

  def self.css_parser_warning_quark : UInt32
    # gtk_css_parser_warning_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_css_parser_warning_quark

    # Return value handling

    _retval
  end

  def self.disable_setlocale : Nil
    # gtk_disable_setlocale: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_disable_setlocale

    # Return value handling
  end

  def self.distribute_natural_allocation(extra_space : Int32, sizes : Enumerable(Gtk::RequestedSize)) : Int32
    # gtk_distribute_natural_allocation: (None)
    # @sizes: (array length=n_requested_sizes element-type Interface)
    # Returns: (transfer none)

    # Generator::ArrayLengthArgPlan
    n_requested_sizes = sizes.size # Generator::ArrayArgPlan
    sizes = sizes.to_a.map(&.to_unsafe).to_unsafe

    # C call
    _retval = LibGtk.gtk_distribute_natural_allocation(extra_space, n_requested_sizes, sizes)

    # Return value handling

    _retval
  end

  def self.editable_delegate_get_property(object : GObject::Object, prop_id : UInt32, value : _, pspec : GObject::ParamSpec) : Bool
    # gtk_editable_delegate_get_property: (None)
    # Returns: (transfer none)

    # Generator::HandmadeArgPlan
    value = if !value.is_a?(GObject::Value)
              GObject::Value.new(value).to_unsafe
            else
              value.to_unsafe
            end

    # C call
    _retval = LibGtk.gtk_editable_delegate_get_property(object, prop_id, value, pspec)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.editable_delegate_set_property(object : GObject::Object, prop_id : UInt32, value : _, pspec : GObject::ParamSpec) : Bool
    # gtk_editable_delegate_set_property: (None)
    # Returns: (transfer none)

    # Generator::HandmadeArgPlan
    value = if !value.is_a?(GObject::Value)
              GObject::Value.new(value).to_unsafe
            else
              value.to_unsafe
            end

    # C call
    _retval = LibGtk.gtk_editable_delegate_set_property(object, prop_id, value, pspec)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.editable_install_properties(object_class : GObject::ObjectClass, first_prop : UInt32) : UInt32
    # gtk_editable_install_properties: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_editable_install_properties(object_class, first_prop)

    # Return value handling

    _retval
  end

  def self.enumerate_printers(func : Gtk::PrinterFunc, data : Pointer(Void)?, destroy : GLib::DestroyNotify, wait : Bool) : Nil
    # gtk_enumerate_printers: (None)
    # @data: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    data = if data.nil?
             Pointer(Void).null
           else
             data.to_unsafe
           end

    # C call
    LibGtk.gtk_enumerate_printers(func, data, destroy, wait)

    # Return value handling
  end

  def self.file_chooser_error_quark : UInt32
    # gtk_file_chooser_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_file_chooser_error_quark

    # Return value handling

    _retval
  end

  def self.binary_age : UInt32
    # gtk_get_binary_age: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_get_binary_age

    # Return value handling

    _retval
  end

  def self.debug_flags : Gtk::DebugFlags
    # gtk_get_debug_flags: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_get_debug_flags

    # Return value handling

    Gtk::DebugFlags.new(_retval)
  end

  def self.default_language : Pango::Language
    # gtk_get_default_language: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_get_default_language

    # Return value handling

    Pango::Language.new(_retval, GICrystal::Transfer::None)
  end

  def self.interface_age : UInt32
    # gtk_get_interface_age: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_get_interface_age

    # Return value handling

    _retval
  end

  def self.locale_direction : Gtk::TextDirection
    # gtk_get_locale_direction: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_get_locale_direction

    # Return value handling

    Gtk::TextDirection.new(_retval)
  end

  def self.major_version : UInt32
    # gtk_get_major_version: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_get_major_version

    # Return value handling

    _retval
  end

  def self.micro_version : UInt32
    # gtk_get_micro_version: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_get_micro_version

    # Return value handling

    _retval
  end

  def self.minor_version : UInt32
    # gtk_get_minor_version: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_get_minor_version

    # Return value handling

    _retval
  end

  def self.hsv_to_rgb(h : Float32, s : Float32, v : Float32, r : Float32, g : Float32, b : Float32) : Nil
    # gtk_hsv_to_rgb: (None)
    # @r: (out) (transfer full)
    # @g: (out) (transfer full)
    # @b: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_hsv_to_rgb(h, s, v, r, g, b)

    # Return value handling
  end

  def self.icon_theme_error_quark : UInt32
    # gtk_icon_theme_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_icon_theme_error_quark

    # Return value handling

    _retval
  end

  def self.init : Nil
    # gtk_init: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_init

    # Return value handling
  end

  def self.init_check : Bool
    # gtk_init_check: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_init_check

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.is_initialized : Bool
    # gtk_is_initialized: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_is_initialized

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.native_get_for_surface(surface : Gdk::Surface) : Gtk::Native?
    # gtk_native_get_for_surface: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_native_get_for_surface(surface)

    # Return value handling

    Gtk::AbstractNative.new(_retval, GICrystal::Transfer::None) unless _retval.null?
  end

  def self.ordering_from_cmpfunc(cmpfunc_result : Int32) : Gtk::Ordering
    # gtk_ordering_from_cmpfunc: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_ordering_from_cmpfunc(cmpfunc_result)

    # Return value handling

    Gtk::Ordering.new(_retval)
  end

  def self.paper_size_get_default : ::String
    # gtk_paper_size_get_default: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_paper_size_get_default

    # Return value handling

    ::String.new(_retval)
  end

  def self.paper_size_get_paper_sizes(include_custom : Bool) : GLib::List
    # gtk_paper_size_get_paper_sizes: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGtk.gtk_paper_size_get_paper_sizes(include_custom)

    # Return value handling

    GLib::List(Gtk::PaperSize).new(_retval, GICrystal::Transfer::Full)
  end

  def self.param_spec_expression(name : ::String, nick : ::String, blurb : ::String, flags : GObject::ParamFlags) : GObject::ParamSpec
    # gtk_param_spec_expression: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGtk.gtk_param_spec_expression(name, nick, blurb, flags)

    # Return value handling

    GObject::ParamSpec.new(_retval, GICrystal::Transfer::Full)
  end

  def self.print_error_quark : UInt32
    # gtk_print_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_print_error_quark

    # Return value handling

    _retval
  end

  def self.print_run_page_setup_dialog(parent : Gtk::Window?, page_setup : Gtk::PageSetup?, settings : Gtk::PrintSettings) : Gtk::PageSetup
    # gtk_print_run_page_setup_dialog: (None)
    # @parent: (nullable)
    # @page_setup: (nullable)
    # Returns: (transfer full)

    # Generator::NullableArrayPlan
    parent = if parent.nil?
               Pointer(Void).null
             else
               parent.to_unsafe
             end
    # Generator::NullableArrayPlan
    page_setup = if page_setup.nil?
                   Pointer(Void).null
                 else
                   page_setup.to_unsafe
                 end

    # C call
    _retval = LibGtk.gtk_print_run_page_setup_dialog(parent, page_setup, settings)

    # Return value handling

    Gtk::PageSetup.new(_retval, GICrystal::Transfer::Full)
  end

  def self.print_run_page_setup_dialog_async(parent : Gtk::Window?, page_setup : Gtk::PageSetup?, settings : Gtk::PrintSettings, done_cb : Gtk::PageSetupDoneFunc, data : Pointer(Void)?) : Nil
    # gtk_print_run_page_setup_dialog_async: (None)
    # @parent: (nullable)
    # @page_setup: (nullable)
    # @data: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    parent = if parent.nil?
               Pointer(Void).null
             else
               parent.to_unsafe
             end
    # Generator::NullableArrayPlan
    page_setup = if page_setup.nil?
                   Pointer(Void).null
                 else
                   page_setup.to_unsafe
                 end
    # Generator::NullableArrayPlan
    data = if data.nil?
             Pointer(Void).null
           else
             data.to_unsafe
           end

    # C call
    LibGtk.gtk_print_run_page_setup_dialog_async(parent, page_setup, settings, done_cb, data)

    # Return value handling
  end

  def self.recent_manager_error_quark : UInt32
    # gtk_recent_manager_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_recent_manager_error_quark

    # Return value handling

    _retval
  end

  def self.render_activity(context : Gtk::StyleContext, cr : Cairo::Context, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
    # gtk_render_activity: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_render_activity(context, cr, x, y, width, height)

    # Return value handling
  end

  def self.render_arrow(context : Gtk::StyleContext, cr : Cairo::Context, angle : Float64, x : Float64, y : Float64, size : Float64) : Nil
    # gtk_render_arrow: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_render_arrow(context, cr, angle, x, y, size)

    # Return value handling
  end

  def self.render_background(context : Gtk::StyleContext, cr : Cairo::Context, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
    # gtk_render_background: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_render_background(context, cr, x, y, width, height)

    # Return value handling
  end

  def self.render_check(context : Gtk::StyleContext, cr : Cairo::Context, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
    # gtk_render_check: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_render_check(context, cr, x, y, width, height)

    # Return value handling
  end

  def self.render_expander(context : Gtk::StyleContext, cr : Cairo::Context, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
    # gtk_render_expander: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_render_expander(context, cr, x, y, width, height)

    # Return value handling
  end

  def self.render_focus(context : Gtk::StyleContext, cr : Cairo::Context, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
    # gtk_render_focus: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_render_focus(context, cr, x, y, width, height)

    # Return value handling
  end

  def self.render_frame(context : Gtk::StyleContext, cr : Cairo::Context, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
    # gtk_render_frame: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_render_frame(context, cr, x, y, width, height)

    # Return value handling
  end

  def self.render_handle(context : Gtk::StyleContext, cr : Cairo::Context, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
    # gtk_render_handle: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_render_handle(context, cr, x, y, width, height)

    # Return value handling
  end

  def self.render_icon(context : Gtk::StyleContext, cr : Cairo::Context, texture : Gdk::Texture, x : Float64, y : Float64) : Nil
    # gtk_render_icon: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_render_icon(context, cr, texture, x, y)

    # Return value handling
  end

  def self.render_layout(context : Gtk::StyleContext, cr : Cairo::Context, x : Float64, y : Float64, layout : Pango::Layout) : Nil
    # gtk_render_layout: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_render_layout(context, cr, x, y, layout)

    # Return value handling
  end

  def self.render_line(context : Gtk::StyleContext, cr : Cairo::Context, x0 : Float64, y0 : Float64, x1 : Float64, y1 : Float64) : Nil
    # gtk_render_line: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_render_line(context, cr, x0, y0, x1, y1)

    # Return value handling
  end

  def self.render_option(context : Gtk::StyleContext, cr : Cairo::Context, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
    # gtk_render_option: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_render_option(context, cr, x, y, width, height)

    # Return value handling
  end

  def self.rgb_to_hsv(r : Float32, g : Float32, b : Float32, h : Float32, s : Float32, v : Float32) : Nil
    # gtk_rgb_to_hsv: (None)
    # @h: (out) (transfer full)
    # @s: (out) (transfer full)
    # @v: (out) (transfer full)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_rgb_to_hsv(r, g, b, h, s, v)

    # Return value handling
  end

  def self.debug_flags=(flags : Gtk::DebugFlags) : Nil
    # gtk_set_debug_flags: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_set_debug_flags(flags)

    # Return value handling
  end

  def self.show_uri(parent : Gtk::Window?, uri : ::String, timestamp : UInt32) : Nil
    # gtk_show_uri: (None)
    # @parent: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    parent = if parent.nil?
               Pointer(Void).null
             else
               parent.to_unsafe
             end

    # C call
    LibGtk.gtk_show_uri(parent, uri, timestamp)

    # Return value handling
  end

  def self.show_uri_full(parent : Gtk::Window?, uri : ::String, timestamp : UInt32, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
    # gtk_show_uri_full: (None)
    # @parent: (nullable)
    # @cancellable: (nullable)
    # @callback: (nullable)
    # @user_data: (nullable)
    # Returns: (transfer none)

    # Generator::NullableArrayPlan
    parent = if parent.nil?
               Pointer(Void).null
             else
               parent.to_unsafe
             end
    # Generator::NullableArrayPlan
    cancellable = if cancellable.nil?
                    Pointer(Void).null
                  else
                    cancellable.to_unsafe
                  end
    # Generator::NullableArrayPlan
    user_data = if user_data.nil?
                  Pointer(Void).null
                else
                  user_data.to_unsafe
                end

    # C call
    LibGtk.gtk_show_uri_full(parent, uri, timestamp, cancellable, callback, user_data)

    # Return value handling
  end

  def show_uri_full_finish(parent : Gtk::Window, result : Gio::AsyncResult) : Bool
    # gtk_show_uri_full_finish: (Throws)
    # Returns: (transfer none)

    _error = Pointer(LibGLib::Error).null

    # C call
    _retval = LibGtk.gtk_show_uri_full_finish(parent, result, pointerof(_error))

    # Error check
    Gtk.raise_exception(_error) unless _error.null?

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.test_accessible_assertion_message_role(domain : ::String, file : ::String, line : Int32, func : ::String, expr : ::String, accessible : Gtk::Accessible, expected_role : Gtk::AccessibleRole, actual_role : Gtk::AccessibleRole) : Nil
    # gtk_test_accessible_assertion_message_role: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_test_accessible_assertion_message_role(domain, file, line, func, expr, accessible, expected_role, actual_role)

    # Return value handling
  end

  def self.test_accessible_has_property(accessible : Gtk::Accessible, property : Gtk::AccessibleProperty) : Bool
    # gtk_test_accessible_has_property: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_test_accessible_has_property(accessible, property)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.test_accessible_has_relation(accessible : Gtk::Accessible, relation : Gtk::AccessibleRelation) : Bool
    # gtk_test_accessible_has_relation: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_test_accessible_has_relation(accessible, relation)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.test_accessible_has_role(accessible : Gtk::Accessible, role : Gtk::AccessibleRole) : Bool
    # gtk_test_accessible_has_role: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_test_accessible_has_role(accessible, role)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.test_accessible_has_state(accessible : Gtk::Accessible, state : Gtk::AccessibleState) : Bool
    # gtk_test_accessible_has_state: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGtk.gtk_test_accessible_has_state(accessible, state)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.test_list_all_types : Enumerable(UInt64)
    # gtk_test_list_all_types: (None)
    # @n_types: (out) (transfer full)
    # Returns: (transfer none) (array length=n_types zero-terminated=1 element-type Gtype)

    # Generator::OutArgUsedInReturnPlan
    n_types = 0_u32
    # C call
    _retval = LibGtk.gtk_test_list_all_types(pointerof(n_types))

    # Return value handling

    GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
  end

  def self.test_register_all_types : Nil
    # gtk_test_register_all_types: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_test_register_all_types

    # Return value handling
  end

  def self.test_widget_wait_for_draw(widget : Gtk::Widget) : Nil
    # gtk_test_widget_wait_for_draw: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_test_widget_wait_for_draw(widget)

    # Return value handling
  end

  def self.tree_create_row_drag_content(tree_model : Gtk::TreeModel, path : Gtk::TreePath) : Gdk::ContentProvider
    # gtk_tree_create_row_drag_content: (None)
    # Returns: (transfer full)

    # C call
    _retval = LibGtk.gtk_tree_create_row_drag_content(tree_model, path)

    # Return value handling

    Gdk::ContentProvider.new(_retval, GICrystal::Transfer::Full)
  end

  def self.tree_get_row_drag_data(value : _) : Bool
    # gtk_tree_get_row_drag_data: (None)
    # @tree_model: (out) (nullable) (optional)
    # @path: (out) (transfer full) (nullable) (optional)
    # Returns: (transfer none)

    # Generator::HandmadeArgPlan
    value = if !value.is_a?(GObject::Value)
              GObject::Value.new(value).to_unsafe
            else
              value.to_unsafe
            end
    # Generator::OutArgUsedInReturnPlan
    tree_model = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
    path = Pointer(Pointer(Void)).null
    # C call
    _retval = LibGtk.gtk_tree_get_row_drag_data(value, tree_model, path)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.tree_row_reference_deleted(proxy : GObject::Object, path : Gtk::TreePath) : Nil
    # gtk_tree_row_reference_deleted: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_tree_row_reference_deleted(proxy, path)

    # Return value handling
  end

  def self.tree_row_reference_inserted(proxy : GObject::Object, path : Gtk::TreePath) : Nil
    # gtk_tree_row_reference_inserted: (None)
    # Returns: (transfer none)

    # C call
    LibGtk.gtk_tree_row_reference_inserted(proxy, path)

    # Return value handling
  end

  def self.value_dup_expression(value : _) : Gtk::Expression?
    # gtk_value_dup_expression: (None)
    # Returns: (transfer full)

    # Generator::HandmadeArgPlan
    value = if !value.is_a?(GObject::Value)
              GObject::Value.new(value).to_unsafe
            else
              value.to_unsafe
            end

    # C call
    _retval = LibGtk.gtk_value_dup_expression(value)

    # Return value handling

    Gtk::Expression.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
  end

  def self.value_get_expression(value : _) : Gtk::Expression?
    # gtk_value_get_expression: (None)
    # Returns: (transfer none)

    # Generator::HandmadeArgPlan
    value = if !value.is_a?(GObject::Value)
              GObject::Value.new(value).to_unsafe
            else
              value.to_unsafe
            end

    # C call
    _retval = LibGtk.gtk_value_get_expression(value)

    # Return value handling

    Gtk::Expression.new(_retval, GICrystal::Transfer::None) unless _retval.null?
  end

  def self.value_set_expression(value : _, expression : Gtk::Expression) : Nil
    # gtk_value_set_expression: (None)
    # Returns: (transfer none)

    # Generator::HandmadeArgPlan
    value = if !value.is_a?(GObject::Value)
              GObject::Value.new(value).to_unsafe
            else
              value.to_unsafe
            end

    # C call
    LibGtk.gtk_value_set_expression(value, expression)

    # Return value handling
  end

  def self.value_take_expression(value : _, expression : Gtk::Expression?) : Nil
    # gtk_value_take_expression: (None)
    # @expression: (transfer full) (nullable)
    # Returns: (transfer none)

    # Generator::HandmadeArgPlan
    value = if !value.is_a?(GObject::Value)
              GObject::Value.new(value).to_unsafe
            else
              value.to_unsafe
            end
    # Generator::NullableArrayPlan
    expression = if expression.nil?
                   Pointer(Void).null
                 else
                   expression.to_unsafe
                 end
    # Generator::TransferFullArgPlan
    LibGObject.gtk_expression_ref(expression)
    # C call
    LibGtk.gtk_value_take_expression(value, expression)

    # Return value handling
  end

  # Errors

  # Error codes that identify various errors that can occur while using
  # `GtkBuilder`.
  class BuilderError < GtkError
    class InvalidTypeFunction < BuilderError
      def code : Int32
        0
      end
    end

    class UnhandledTag < BuilderError
      def code : Int32
        1
      end
    end

    class MissingAttribute < BuilderError
      def code : Int32
        2
      end
    end

    class InvalidAttribute < BuilderError
      def code : Int32
        3
      end
    end

    class InvalidTag < BuilderError
      def code : Int32
        4
      end
    end

    class MissingPropertyValue < BuilderError
      def code : Int32
        5
      end
    end

    class InvalidValue < BuilderError
      def code : Int32
        6
      end
    end

    class VersionMismatch < BuilderError
      def code : Int32
        7
      end
    end

    class DuplicateId < BuilderError
      def code : Int32
        8
      end
    end

    class ObjectTypeRefused < BuilderError
      def code : Int32
        9
      end
    end

    class TemplateMismatch < BuilderError
      def code : Int32
        10
      end
    end

    class InvalidProperty < BuilderError
      def code : Int32
        11
      end
    end

    class InvalidSignal < BuilderError
      def code : Int32
        12
      end
    end

    class InvalidId < BuilderError
      def code : Int32
        13
      end
    end

    class InvalidFunction < BuilderError
      def code : Int32
        14
      end
    end
  end

  # Domain for VFL parsing errors.
  class ConstraintVflParserError < GtkError
    class Symbol < ConstraintVflParserError
      def code : Int32
        0
      end
    end

    class Attribute < ConstraintVflParserError
      def code : Int32
        1
      end
    end

    class View < ConstraintVflParserError
      def code : Int32
        2
      end
    end

    class Metric < ConstraintVflParserError
      def code : Int32
        3
      end
    end

    class Priority < ConstraintVflParserError
      def code : Int32
        4
      end
    end

    class Relation < ConstraintVflParserError
      def code : Int32
        5
      end
    end
  end

  # Errors that can occur while parsing CSS.
  #
  # These errors are unexpected and will cause parts of the given CSS
  # to be ignored.
  class CssParserError < GtkError
    class Failed < CssParserError
      def code : Int32
        0
      end
    end

    class Syntax < CssParserError
      def code : Int32
        1
      end
    end

    class Import < CssParserError
      def code : Int32
        2
      end
    end

    class Name < CssParserError
      def code : Int32
        3
      end
    end

    class UnknownValue < CssParserError
      def code : Int32
        4
      end
    end
  end

  # These identify the various errors that can occur while calling
  # `GtkFileChooser` functions.
  class FileChooserError < GtkError
    class Nonexistent < FileChooserError
      def code : Int32
        0
      end
    end

    class BadFilename < FileChooserError
      def code : Int32
        1
      end
    end

    class AlreadyExists < FileChooserError
      def code : Int32
        2
      end
    end

    class IncompleteHostname < FileChooserError
      def code : Int32
        3
      end
    end
  end

  # Error codes for `GtkIconTheme` operations.
  class IconThemeError < GtkError
    class NotFound < IconThemeError
      def code : Int32
        0
      end
    end

    class Failed < IconThemeError
      def code : Int32
        1
      end
    end
  end

  # Error codes that identify various errors that can occur while
  # using the GTK printing support.
  class PrintError < GtkError
    class General < PrintError
      def code : Int32
        0
      end
    end

    class InternalError < PrintError
      def code : Int32
        1
      end
    end

    class Nomem < PrintError
      def code : Int32
        2
      end
    end

    class InvalidFile < PrintError
      def code : Int32
        3
      end
    end
  end

  # Error codes for `GtkRecentManager` operations
  class RecentManagerError < GtkError
    class NotFound < RecentManagerError
      def code : Int32
        0
      end
    end

    class InvalidUri < RecentManagerError
      def code : Int32
        1
      end
    end

    class InvalidEncoding < RecentManagerError
      def code : Int32
        2
      end
    end

    class NotRegistered < RecentManagerError
      def code : Int32
        3
      end
    end

    class Read < RecentManagerError
      def code : Int32
        4
      end
    end

    class Write < RecentManagerError
      def code : Int32
        5
      end
    end

    class Unknown < RecentManagerError
      def code : Int32
        6
      end
    end
  end

  # :nodoc:
  def raise_exception(error : Pointer(LibGLib::Error))
    error_domain = error.value.domain
    error_code = error.value.code

    if error_domain == LibGLib.g_quark_try_string("gtk-builder-error-quark")
      raise BuilderError::InvalidTypeFunction.new(error) if error_code == 0
      raise BuilderError::UnhandledTag.new(error) if error_code == 1
      raise BuilderError::MissingAttribute.new(error) if error_code == 2
      raise BuilderError::InvalidAttribute.new(error) if error_code == 3
      raise BuilderError::InvalidTag.new(error) if error_code == 4
      raise BuilderError::MissingPropertyValue.new(error) if error_code == 5
      raise BuilderError::InvalidValue.new(error) if error_code == 6
      raise BuilderError::VersionMismatch.new(error) if error_code == 7
      raise BuilderError::DuplicateId.new(error) if error_code == 8
      raise BuilderError::ObjectTypeRefused.new(error) if error_code == 9
      raise BuilderError::TemplateMismatch.new(error) if error_code == 10
      raise BuilderError::InvalidProperty.new(error) if error_code == 11
      raise BuilderError::InvalidSignal.new(error) if error_code == 12
      raise BuilderError::InvalidId.new(error) if error_code == 13
      raise BuilderError::InvalidFunction.new(error) if error_code == 14
    end

    if error_domain == LibGLib.g_quark_try_string("gtk-constraint-vfl-parser-error-quark")
      raise ConstraintVflParserError::Symbol.new(error) if error_code == 0
      raise ConstraintVflParserError::Attribute.new(error) if error_code == 1
      raise ConstraintVflParserError::View.new(error) if error_code == 2
      raise ConstraintVflParserError::Metric.new(error) if error_code == 3
      raise ConstraintVflParserError::Priority.new(error) if error_code == 4
      raise ConstraintVflParserError::Relation.new(error) if error_code == 5
    end

    if error_domain == LibGLib.g_quark_try_string("gtk-css-parser-error-quark")
      raise CssParserError::Failed.new(error) if error_code == 0
      raise CssParserError::Syntax.new(error) if error_code == 1
      raise CssParserError::Import.new(error) if error_code == 2
      raise CssParserError::Name.new(error) if error_code == 3
      raise CssParserError::UnknownValue.new(error) if error_code == 4
    end

    if error_domain == LibGLib.g_quark_try_string("gtk-file-chooser-error-quark")
      raise FileChooserError::Nonexistent.new(error) if error_code == 0
      raise FileChooserError::BadFilename.new(error) if error_code == 1
      raise FileChooserError::AlreadyExists.new(error) if error_code == 2
      raise FileChooserError::IncompleteHostname.new(error) if error_code == 3
    end

    if error_domain == LibGLib.g_quark_try_string("gtk-icon-theme-error-quark")
      raise IconThemeError::NotFound.new(error) if error_code == 0
      raise IconThemeError::Failed.new(error) if error_code == 1
    end

    if error_domain == LibGLib.g_quark_try_string("gtk-print-error-quark")
      raise PrintError::General.new(error) if error_code == 0
      raise PrintError::InternalError.new(error) if error_code == 1
      raise PrintError::Nomem.new(error) if error_code == 2
      raise PrintError::InvalidFile.new(error) if error_code == 3
    end

    if error_domain == LibGLib.g_quark_try_string("gtk-recent-manager-error-quark")
      raise RecentManagerError::NotFound.new(error) if error_code == 0
      raise RecentManagerError::InvalidUri.new(error) if error_code == 1
      raise RecentManagerError::InvalidEncoding.new(error) if error_code == 2
      raise RecentManagerError::NotRegistered.new(error) if error_code == 3
      raise RecentManagerError::Read.new(error) if error_code == 4
      raise RecentManagerError::Write.new(error) if error_code == 5
      raise RecentManagerError::Unknown.new(error) if error_code == 6
    end

    Gsk.raise_exception(error)
    Gdk.raise_exception(error)
  end

  extend self
end

# Extra includes
require "../../../lib/gtk4/src/bindings/gtk/about_dialog.cr"
require "../../../lib/gtk4/src/bindings/gtk/builder.cr"
require "../../../lib/gtk4/src/bindings/gtk/list_store.cr"
require "../../../lib/gtk4/src/bindings/gtk/message_dialog.cr"
require "../../../lib/gtk4/src/bindings/gtk/stack.cr"
require "../../../lib/gtk4/src/bindings/gtk/tree_store.cr"
require "../../../lib/gtk4/src/bindings/gtk/tree_view.cr"
require "../../../lib/gtk4/src/bindings/gtk/widget.cr"
require "../../../lib/gtk4/src/bindings/gtk/widget_template.cr"

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
  ACCESSIBLE_VALUE_UNDEFINED            =  -1
  BINARY_AGE                            = 600
  IM_MODULE_EXTENSION_POINT_NAME        = "gtk-im-module"
  INPUT_ERROR                           =             -1
  INTERFACE_AGE                         =              0
  INVALID_LIST_POSITION                 = 4294967295_u32
  LEVEL_BAR_OFFSET_FULL                 = "full"
  LEVEL_BAR_OFFSET_HIGH                 = "high"
  LEVEL_BAR_OFFSET_LOW                  = "low"
  MAJOR_VERSION                         = 4
  MAX_COMPOSE_LEN                       = 7
  MEDIA_FILE_EXTENSION_POINT_NAME       = "gtk-media-file"
  MICRO_VERSION                         = 0
  MINOR_VERSION                         = 6
  PAPER_NAME_A3                         = "iso_a3"
  PAPER_NAME_A4                         = "iso_a4"
  PAPER_NAME_A5                         = "iso_a5"
  PAPER_NAME_B5                         = "iso_b5"
  PAPER_NAME_EXECUTIVE                  = "na_executive"
  PAPER_NAME_LEGAL                      = "na_legal"
  PAPER_NAME_LETTER                     = "na_letter"
  PRINT_SETTINGS_COLLATE                = "collate"
  PRINT_SETTINGS_DEFAULT_SOURCE         = "default-source"
  PRINT_SETTINGS_DITHER                 = "dither"
  PRINT_SETTINGS_DUPLEX                 = "duplex"
  PRINT_SETTINGS_FINISHINGS             = "finishings"
  PRINT_SETTINGS_MEDIA_TYPE             = "media-type"
  PRINT_SETTINGS_NUMBER_UP              = "number-up"
  PRINT_SETTINGS_NUMBER_UP_LAYOUT       = "number-up-layout"
  PRINT_SETTINGS_N_COPIES               = "n-copies"
  PRINT_SETTINGS_ORIENTATION            = "orientation"
  PRINT_SETTINGS_OUTPUT_BASENAME        = "output-basename"
  PRINT_SETTINGS_OUTPUT_BIN             = "output-bin"
  PRINT_SETTINGS_OUTPUT_DIR             = "output-dir"
  PRINT_SETTINGS_OUTPUT_FILE_FORMAT     = "output-file-format"
  PRINT_SETTINGS_OUTPUT_URI             = "output-uri"
  PRINT_SETTINGS_PAGE_RANGES            = "page-ranges"
  PRINT_SETTINGS_PAGE_SET               = "page-set"
  PRINT_SETTINGS_PAPER_FORMAT           = "paper-format"
  PRINT_SETTINGS_PAPER_HEIGHT           = "paper-height"
  PRINT_SETTINGS_PAPER_WIDTH            = "paper-width"
  PRINT_SETTINGS_PRINTER                = "printer"
  PRINT_SETTINGS_PRINTER_LPI            = "printer-lpi"
  PRINT_SETTINGS_PRINT_PAGES            = "print-pages"
  PRINT_SETTINGS_QUALITY                = "quality"
  PRINT_SETTINGS_RESOLUTION             = "resolution"
  PRINT_SETTINGS_RESOLUTION_X           = "resolution-x"
  PRINT_SETTINGS_RESOLUTION_Y           = "resolution-y"
  PRINT_SETTINGS_REVERSE                = "reverse"
  PRINT_SETTINGS_SCALE                  = "scale"
  PRINT_SETTINGS_USE_COLOR              = "use-color"
  PRINT_SETTINGS_WIN32_DRIVER_EXTRA     = "win32-driver-extra"
  PRINT_SETTINGS_WIN32_DRIVER_VERSION   = "win32-driver-version"
  PRIORITY_RESIZE                       = 110
  STYLE_PROVIDER_PRIORITY_APPLICATION   = 600
  STYLE_PROVIDER_PRIORITY_FALLBACK      =   1
  STYLE_PROVIDER_PRIORITY_SETTINGS      = 400
  STYLE_PROVIDER_PRIORITY_THEME         = 200
  STYLE_PROVIDER_PRIORITY_USER          = 800
  TEXT_VIEW_PRIORITY_VALIDATE           = 125
  TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID  =  -1
  TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID =  -2

  enum AccessibleAutocomplete : UInt32
    None   = 0
    Inline = 1
    List   = 2
    Both   = 3
  end

  enum AccessibleInvalidState : UInt32
    False    = 0
    True     = 1
    Grammar  = 2
    Spelling = 3
  end

  enum AccessibleProperty : UInt32
    Autocomplete    =  0
    Description     =  1
    HasPopup        =  2
    KeyShortcuts    =  3
    Label           =  4
    Level           =  5
    Modal           =  6
    MultiLine       =  7
    MultiSelectable =  8
    Orientation     =  9
    Placeholder     = 10
    ReadOnly        = 11
    Required        = 12
    RoleDescription = 13
    Sort            = 14
    ValueMax        = 15
    ValueMin        = 16
    ValueNow        = 17
    ValueText       = 18
  end

  enum AccessibleRelation : UInt32
    ActiveDescendant =  0
    ColCount         =  1
    ColIndex         =  2
    ColIndexText     =  3
    ColSpan          =  4
    Controls         =  5
    DescribedBy      =  6
    Details          =  7
    ErrorMessage     =  8
    FlowTo           =  9
    LabelledBy       = 10
    Owns             = 11
    PosInSet         = 12
    RowCount         = 13
    RowIndex         = 14
    RowIndexText     = 15
    RowSpan          = 16
    SetSize          = 17
  end

  enum AccessibleRole : UInt32
    Alert            =  0
    AlertDialog      =  1
    Banner           =  2
    Button           =  3
    Caption          =  4
    Cell             =  5
    Checkbox         =  6
    ColumnHeader     =  7
    ComboBox         =  8
    Command          =  9
    Composite        = 10
    Dialog           = 11
    Document         = 12
    Feed             = 13
    Form             = 14
    Generic          = 15
    Grid             = 16
    GridCell         = 17
    Group            = 18
    Heading          = 19
    Img              = 20
    Input            = 21
    Label            = 22
    Landmark         = 23
    Legend           = 24
    Link             = 25
    List             = 26
    ListBox          = 27
    ListItem         = 28
    Log              = 29
    Main             = 30
    Marquee          = 31
    Math             = 32
    Meter            = 33
    Menu             = 34
    MenuBar          = 35
    MenuItem         = 36
    MenuItemCheckbox = 37
    MenuItemRadio    = 38
    Navigation       = 39
    None             = 40
    Note             = 41
    Option           = 42
    Presentation     = 43
    ProgressBar      = 44
    Radio            = 45
    RadioGroup       = 46
    Range            = 47
    Region           = 48
    Row              = 49
    RowGroup         = 50
    RowHeader        = 51
    Scrollbar        = 52
    Search           = 53
    SearchBox        = 54
    Section          = 55
    SectionHead      = 56
    Select           = 57
    Separator        = 58
    Slider           = 59
    SpinButton       = 60
    Status           = 61
    Structure        = 62
    Switch           = 63
    Tab              = 64
    Table            = 65
    TabList          = 66
    TabPanel         = 67
    TextBox          = 68
    Time             = 69
    Timer            = 70
    Toolbar          = 71
    Tooltip          = 72
    Tree             = 73
    TreeGrid         = 74
    TreeItem         = 75
    Widget           = 76
    Window           = 77
  end

  enum AccessibleSort : UInt32
    None       = 0
    Ascending  = 1
    Descending = 2
    Other      = 3
  end

  enum AccessibleState : UInt32
    Busy     = 0
    Checked  = 1
    Disabled = 2
    Expanded = 3
    Hidden   = 4
    Invalid  = 5
    Pressed  = 6
    Selected = 7
  end

  enum AccessibleTristate : UInt32
    False = 0
    True  = 1
    Mixed = 2
  end

  enum Align : UInt32
    Fill     = 0
    Start    = 1
    End      = 2
    Center   = 3
    Baseline = 4
  end

  enum ArrowType : UInt32
    Up    = 0
    Down  = 1
    Left  = 2
    Right = 3
    None  = 4
  end

  enum AssistantPageType : UInt32
    Content  = 0
    Intro    = 1
    Confirm  = 2
    Summary  = 3
    Progress = 4
    Custom   = 5
  end

  enum BaselinePosition : UInt32
    Top    = 0
    Center = 1
    Bottom = 2
  end

  enum BorderStyle : UInt32
    None   = 0
    Hidden = 1
    Solid  = 2
    Inset  = 3
    Outset = 4
    Dotted = 5
    Dashed = 6
    Double = 7
    Groove = 8
    Ridge  = 9
  end

  enum BuilderError : UInt32
    InvalidTypeFunction  =  0
    UnhandledTag         =  1
    MissingAttribute     =  2
    InvalidAttribute     =  3
    InvalidTag           =  4
    MissingPropertyValue =  5
    InvalidValue         =  6
    VersionMismatch      =  7
    DuplicateId          =  8
    ObjectTypeRefused    =  9
    TemplateMismatch     = 10
    InvalidProperty      = 11
    InvalidSignal        = 12
    InvalidId            = 13
    InvalidFunction      = 14
  end

  enum ButtonsType : UInt32
    None     = 0
    Ok       = 1
    Close    = 2
    Cancel   = 3
    YesNo    = 4
    OkCancel = 5
  end

  enum CellRendererAccelMode : UInt32
    Gtk   = 0
    Other = 1
  end

  enum CellRendererMode : UInt32
    Inert       = 0
    Activatable = 1
    Editable    = 2
  end

  enum ConstraintAttribute : UInt32
    None     =  0
    Left     =  1
    Right    =  2
    Top      =  3
    Bottom   =  4
    Start    =  5
    End      =  6
    Width    =  7
    Height   =  8
    CenterX  =  9
    CenterY  = 10
    Baseline = 11
  end

  enum ConstraintRelation : Int32
    Le = -1
    Eq =  0
    Ge =  1
  end

  enum ConstraintStrength : UInt32
    Required = 1001001000
    Strong   = 1000000000
    Medium   =       1000
    Weak     =          1
  end

  enum ConstraintVflParserError : UInt32
    Symbol    = 0
    Attribute = 1
    View      = 2
    Metric    = 3
    Priority  = 4
    Relation  = 5
  end

  enum CornerType : UInt32
    TopLeft     = 0
    BottomLeft  = 1
    TopRight    = 2
    BottomRight = 3
  end

  enum CssParserError : UInt32
    Failed       = 0
    Syntax       = 1
    Import       = 2
    Name         = 3
    UnknownValue = 4
  end

  enum CssParserWarning : UInt32
    Deprecated    = 0
    Syntax        = 1
    Unimplemented = 2
  end

  enum DeleteType : UInt32
    Chars           = 0
    WordEnds        = 1
    Words           = 2
    DisplayLines    = 3
    DisplayLineEnds = 4
    ParagraphEnds   = 5
    Paragraphs      = 6
    Whitespace      = 7
  end

  enum DirectionType : UInt32
    TabForward  = 0
    TabBackward = 1
    Up          = 2
    Down        = 3
    Left        = 4
    Right       = 5
  end

  enum EditableProperties : UInt32
    PropText           = 0
    PropCursorPosition = 1
    PropSelectionBound = 2
    PropEditable       = 3
    PropWidthChars     = 4
    PropMaxWidthChars  = 5
    PropXalign         = 6
    PropEnableUndo     = 7
    NumProperties      = 8
  end

  enum EntryIconPosition : UInt32
    Primary   = 0
    Secondary = 1
  end

  enum EventSequenceState : UInt32
    None    = 0
    Claimed = 1
    Denied  = 2
  end

  enum FileChooserAction : UInt32
    Open         = 0
    Save         = 1
    SelectFolder = 2
  end

  enum FileChooserError : UInt32
    Nonexistent        = 0
    BadFilename        = 1
    AlreadyExists      = 2
    IncompleteHostname = 3
  end

  enum FilterChange : UInt32
    Different  = 0
    LessStrict = 1
    MoreStrict = 2
  end

  enum FilterMatch : UInt32
    Some = 0
    None = 1
    All  = 2
  end

  enum IconSize : UInt32
    Inherit = 0
    Normal  = 1
    Large   = 2
  end

  enum IconThemeError : UInt32
    NotFound = 0
    Failed   = 1
  end

  enum IconViewDropPosition : UInt32
    NoDrop    = 0
    DropInto  = 1
    DropLeft  = 2
    DropRight = 3
    DropAbove = 4
    DropBelow = 5
  end

  enum ImageType : UInt32
    Empty     = 0
    IconName  = 1
    Gicon     = 2
    Paintable = 3
  end

  enum InputPurpose : UInt32
    FreeForm =  0
    Alpha    =  1
    Digits   =  2
    Number   =  3
    Phone    =  4
    Url      =  5
    Email    =  6
    Name     =  7
    Password =  8
    Pin      =  9
    Terminal = 10
  end

  enum Justification : UInt32
    Left   = 0
    Right  = 1
    Center = 2
    Fill   = 3
  end

  enum LevelBarMode : UInt32
    Continuous = 0
    Discrete   = 1
  end

  enum License : UInt32
    Unknown    =  0
    Custom     =  1
    Gpl20      =  2
    Gpl30      =  3
    Lgpl21     =  4
    Lgpl30     =  5
    Bsd        =  6
    MitX11     =  7
    Artistic   =  8
    Gpl20Only  =  9
    Gpl30Only  = 10
    Lgpl21Only = 11
    Lgpl30Only = 12
    Agpl30     = 13
    Agpl30Only = 14
    Bsd3       = 15
    Apache20   = 16
    Mpl20      = 17
  end

  enum MessageType : UInt32
    Info     = 0
    Warning  = 1
    Question = 2
    Error    = 3
    Other    = 4
  end

  enum MovementStep : UInt32
    LogicalPositions = 0
    VisualPositions  = 1
    Words            = 2
    DisplayLines     = 3
    DisplayLineEnds  = 4
    Paragraphs       = 5
    ParagraphEnds    = 6
    Pages            = 7
    BufferEnds       = 8
    HorizontalPages  = 9
  end

  enum NaturalWrapMode : UInt32
    Inherit = 0
    None    = 1
    Word    = 2
  end

  enum NotebookTab : UInt32
    First = 0
    Last  = 1
  end

  enum NumberUpLayout : UInt32
    Lrtb = 0
    Lrbt = 1
    Rltb = 2
    Rlbt = 3
    Tblr = 4
    Tbrl = 5
    Btlr = 6
    Btrl = 7
  end

  enum Ordering : Int32
    Smaller = -1
    Equal   =  0
    Larger  =  1
  end

  enum Orientation : UInt32
    Horizontal = 0
    Vertical   = 1
  end

  enum Overflow : UInt32
    Visible = 0
    Hidden  = 1
  end

  enum PackType : UInt32
    Start = 0
    End   = 1
  end

  enum PadActionType : UInt32
    Button = 0
    Ring   = 1
    Strip  = 2
  end

  enum PageOrientation : UInt32
    Portrait         = 0
    Landscape        = 1
    ReversePortrait  = 2
    ReverseLandscape = 3
  end

  enum PageSet : UInt32
    All  = 0
    Even = 1
    Odd  = 2
  end

  enum PanDirection : UInt32
    Left  = 0
    Right = 1
    Up    = 2
    Down  = 3
  end

  enum PolicyType : UInt32
    Always    = 0
    Automatic = 1
    Never     = 2
    External  = 3
  end

  enum PositionType : UInt32
    Left   = 0
    Right  = 1
    Top    = 2
    Bottom = 3
  end

  enum PrintDuplex : UInt32
    Simplex    = 0
    Horizontal = 1
    Vertical   = 2
  end

  enum PrintError : UInt32
    General       = 0
    InternalError = 1
    Nomem         = 2
    InvalidFile   = 3
  end

  enum PrintOperationAction : UInt32
    PrintDialog = 0
    Print       = 1
    Preview     = 2
    Export      = 3
  end

  enum PrintOperationResult : UInt32
    Error      = 0
    Apply      = 1
    Cancel     = 2
    InProgress = 3
  end

  enum PrintPages : UInt32
    All       = 0
    Current   = 1
    Ranges    = 2
    Selection = 3
  end

  enum PrintQuality : UInt32
    Low    = 0
    Normal = 1
    High   = 2
    Draft  = 3
  end

  enum PrintStatus : UInt32
    Initial         = 0
    Preparing       = 1
    GeneratingData  = 2
    SendingData     = 3
    Pending         = 4
    PendingIssue    = 5
    Printing        = 6
    Finished        = 7
    FinishedAborted = 8
  end

  enum PropagationLimit : UInt32
    None       = 0
    SameNative = 1
  end

  enum PropagationPhase : UInt32
    None    = 0
    Capture = 1
    Bubble  = 2
    Target  = 3
  end

  enum RecentManagerError : UInt32
    NotFound        = 0
    InvalidUri      = 1
    InvalidEncoding = 2
    NotRegistered   = 3
    Read            = 4
    Write           = 5
    Unknown         = 6
  end

  enum ResponseType : Int32
    None        =  -1
    Reject      =  -2
    Accept      =  -3
    DeleteEvent =  -4
    Ok          =  -5
    Cancel      =  -6
    Close       =  -7
    Yes         =  -8
    No          =  -9
    Apply       = -10
    Help        = -11
  end

  enum RevealerTransitionType : UInt32
    None       = 0
    Crossfade  = 1
    SlideRight = 2
    SlideLeft  = 3
    SlideUp    = 4
    SlideDown  = 5
    SwingRight = 6
    SwingLeft  = 7
    SwingUp    = 8
    SwingDown  = 9
  end

  enum ScrollStep : UInt32
    Steps           = 0
    Pages           = 1
    Ends            = 2
    HorizontalSteps = 3
    HorizontalPages = 4
    HorizontalEnds  = 5
  end

  enum ScrollType : UInt32
    None         =  0
    Jump         =  1
    StepBackward =  2
    StepForward  =  3
    PageBackward =  4
    PageForward  =  5
    StepUp       =  6
    StepDown     =  7
    PageUp       =  8
    PageDown     =  9
    StepLeft     = 10
    StepRight    = 11
    PageLeft     = 12
    PageRight    = 13
    Start        = 14
    End          = 15
  end

  enum ScrollablePolicy : UInt32
    Minimum = 0
    Natural = 1
  end

  enum SelectionMode : UInt32
    None     = 0
    Single   = 1
    Browse   = 2
    Multiple = 3
  end

  enum SensitivityType : UInt32
    Auto = 0
    On   = 1
    Off  = 2
  end

  enum ShortcutScope : UInt32
    Local   = 0
    Managed = 1
    Global  = 2
  end

  enum ShortcutType : UInt32
    Accelerator                   = 0
    GesturePinch                  = 1
    GestureStretch                = 2
    GestureRotateClockwise        = 3
    GestureRotateCounterclockwise = 4
    GestureTwoFingerSwipeLeft     = 5
    GestureTwoFingerSwipeRight    = 6
    Gesture                       = 7
    GestureSwipeLeft              = 8
    GestureSwipeRight             = 9
  end

  enum SizeGroupMode : UInt32
    None       = 0
    Horizontal = 1
    Vertical   = 2
    Both       = 3
  end

  enum SizeRequestMode : UInt32
    HeightForWidth = 0
    WidthForHeight = 1
    ConstantSize   = 2
  end

  enum SortType : UInt32
    Ascending  = 0
    Descending = 1
  end

  enum SorterChange : UInt32
    Different  = 0
    Inverted   = 1
    LessStrict = 2
    MoreStrict = 3
  end

  enum SorterOrder : UInt32
    Partial = 0
    None    = 1
    Total   = 2
  end

  enum SpinButtonUpdatePolicy : UInt32
    Always  = 0
    IfValid = 1
  end

  enum SpinType : UInt32
    StepForward  = 0
    StepBackward = 1
    PageForward  = 2
    PageBackward = 3
    Home         = 4
    End          = 5
    UserDefined  = 6
  end

  enum StackTransitionType : UInt32
    None            =  0
    Crossfade       =  1
    SlideRight      =  2
    SlideLeft       =  3
    SlideUp         =  4
    SlideDown       =  5
    SlideLeftRight  =  6
    SlideUpDown     =  7
    OverUp          =  8
    OverDown        =  9
    OverLeft        = 10
    OverRight       = 11
    UnderUp         = 12
    UnderDown       = 13
    UnderLeft       = 14
    UnderRight      = 15
    OverUpDown      = 16
    OverDownUp      = 17
    OverLeftRight   = 18
    OverRightLeft   = 19
    RotateLeft      = 20
    RotateRight     = 21
    RotateLeftRight = 22
  end

  enum StringFilterMatchMode : UInt32
    Exact     = 0
    Substring = 1
    Prefix    = 2
  end

  enum SymbolicColor : UInt32
    Foreground = 0
    Error      = 1
    Warning    = 2
    Success    = 3
  end

  enum SystemSetting : UInt32
    Dpi        = 0
    FontName   = 1
    FontConfig = 2
    Display    = 3
    IconTheme  = 4
  end

  enum TextDirection : UInt32
    None = 0
    Ltr  = 1
    Rtl  = 2
  end

  enum TextExtendSelection : UInt32
    Word = 0
    Line = 1
  end

  enum TextViewLayer : UInt32
    BelowText = 0
    AboveText = 1
  end

  enum TextWindowType : UInt32
    Widget = 1
    Text   = 2
    Left   = 3
    Right  = 4
    Top    = 5
    Bottom = 6
  end

  enum TreeViewColumnSizing : UInt32
    GrowOnly = 0
    Autosize = 1
    Fixed    = 2
  end

  enum TreeViewDropPosition : UInt32
    Before       = 0
    After        = 1
    IntoOrBefore = 2
    IntoOrAfter  = 3
  end

  enum TreeViewGridLines : UInt32
    None       = 0
    Horizontal = 1
    Vertical   = 2
    Both       = 3
  end

  enum Unit : UInt32
    None   = 0
    Points = 1
    Inch   = 2
    Mm     = 3
  end

  enum WrapMode : UInt32
    None     = 0
    Char     = 1
    Word     = 2
    WordChar = 3
  end

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

  extend self
end

# Extra includes
require "./includes/about_dialog.cr"
require "./includes/builder.cr"
require "./includes/list_store.cr"
require "./includes/message_dialog.cr"
require "./includes/tree_view.cr"

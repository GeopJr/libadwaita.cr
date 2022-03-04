@[Link("gtk-4", pkg_config: "gtk-4")]

lib LibGtk
  # Flags
  type ApplicationInhibitFlags = UInt32
  type BuilderClosureFlags = UInt32
  type CellRendererState = UInt32
  type DebugFlags = UInt32
  type DialogFlags = UInt32
  type EventControllerScrollFlags = UInt32
  type FontChooserLevel = UInt32
  type IconLookupFlags = UInt32
  type InputHints = UInt32
  type PickFlags = UInt32
  type PopoverMenuFlags = UInt32
  type PrintCapabilities = UInt32
  type ShortcutActionFlags = UInt32
  type StateFlags = UInt32
  type StyleContextPrintFlags = UInt32
  type TextSearchFlags = UInt32
  type TreeModelFlags = UInt32

  # Enums
  type AccessibleAutocomplete = UInt32
  type AccessibleInvalidState = UInt32
  type AccessibleProperty = UInt32
  type AccessibleRelation = UInt32
  type AccessibleRole = UInt32
  type AccessibleSort = UInt32
  type AccessibleState = UInt32
  type AccessibleTristate = UInt32
  type Align = UInt32
  type ArrowType = UInt32
  type AssistantPageType = UInt32
  type BaselinePosition = UInt32
  type BorderStyle = UInt32
  type BuilderError = UInt32
  type ButtonsType = UInt32
  type CellRendererAccelMode = UInt32
  type CellRendererMode = UInt32
  type ConstraintAttribute = UInt32
  type ConstraintRelation = Int32
  type ConstraintStrength = UInt32
  type ConstraintVflParserError = UInt32
  type CornerType = UInt32
  type CssParserError = UInt32
  type CssParserWarning = UInt32
  type DeleteType = UInt32
  type DirectionType = UInt32
  type EditableProperties = UInt32
  type EntryIconPosition = UInt32
  type EventSequenceState = UInt32
  type FileChooserAction = UInt32
  type FileChooserError = UInt32
  type FilterChange = UInt32
  type FilterMatch = UInt32
  type IconSize = UInt32
  type IconThemeError = UInt32
  type IconViewDropPosition = UInt32
  type ImageType = UInt32
  type InputPurpose = UInt32
  type Justification = UInt32
  type LevelBarMode = UInt32
  type License = UInt32
  type MessageType = UInt32
  type MovementStep = UInt32
  type NotebookTab = UInt32
  type NumberUpLayout = UInt32
  type Ordering = Int32
  type Orientation = UInt32
  type Overflow = UInt32
  type PackType = UInt32
  type PadActionType = UInt32
  type PageOrientation = UInt32
  type PageSet = UInt32
  type PanDirection = UInt32
  type PolicyType = UInt32
  type PositionType = UInt32
  type PrintDuplex = UInt32
  type PrintError = UInt32
  type PrintOperationAction = UInt32
  type PrintOperationResult = UInt32
  type PrintPages = UInt32
  type PrintQuality = UInt32
  type PrintStatus = UInt32
  type PropagationLimit = UInt32
  type PropagationPhase = UInt32
  type RecentManagerError = UInt32
  type ResponseType = Int32
  type RevealerTransitionType = UInt32
  type ScrollStep = UInt32
  type ScrollType = UInt32
  type ScrollablePolicy = UInt32
  type SelectionMode = UInt32
  type SensitivityType = UInt32
  type ShortcutScope = UInt32
  type ShortcutType = UInt32
  type SizeGroupMode = UInt32
  type SizeRequestMode = UInt32
  type SortType = UInt32
  type SorterChange = UInt32
  type SorterOrder = UInt32
  type SpinButtonUpdatePolicy = UInt32
  type SpinType = UInt32
  type StackTransitionType = UInt32
  type StringFilterMatchMode = UInt32
  type SystemSetting = UInt32
  type TextDirection = UInt32
  type TextExtendSelection = UInt32
  type TextViewLayer = UInt32
  type TextWindowType = UInt32
  type TreeViewColumnSizing = UInt32
  type TreeViewDropPosition = UInt32
  type TreeViewGridLines = UInt32
  type Unit = UInt32
  type WrapMode = UInt32

  # Callbacks
  alias AssistantPageFunc = Int32, Pointer(Void) -> Int32
  alias CellAllocCallback = Pointer(LibGtk::CellRenderer), Pointer(LibGdk::Rectangle), Pointer(LibGdk::Rectangle), Pointer(Void) -> LibC::Int
  alias CellCallback = Pointer(LibGtk::CellRenderer), Pointer(Void) -> LibC::Int
  alias CellLayoutDataFunc = Pointer(LibGtk::CellLayout), Pointer(LibGtk::CellRenderer), Pointer(LibGtk::TreeModel), Pointer(LibGtk::TreeIter), Pointer(Void) -> Void
  alias CustomAllocateFunc = Pointer(LibGtk::Widget), Int32, Int32, Int32 -> Void
  alias CustomFilterFunc = Pointer(LibGObject::Object), Pointer(Void) -> LibC::Int
  alias CustomMeasureFunc = Pointer(LibGtk::Widget), UInt32, Int32, Int32, Int32, Int32, Int32 -> Void
  alias CustomRequestModeFunc = Pointer(LibGtk::Widget) -> UInt32
  alias DrawingAreaDrawFunc = Pointer(LibGtk::DrawingArea), Pointer(LibCairo::Context), Int32, Int32, Pointer(Void) -> Void
  alias EntryCompletionMatchFunc = Pointer(LibGtk::EntryCompletion), Pointer(LibC::Char), Pointer(LibGtk::TreeIter), Pointer(Void) -> LibC::Int
  alias ExpressionNotify = Pointer(Void) -> Void
  alias FlowBoxCreateWidgetFunc = Pointer(LibGObject::Object), Pointer(Void) -> Pointer(LibGtk::Widget)
  alias FlowBoxFilterFunc = Pointer(LibGtk::FlowBoxChild), Pointer(Void) -> LibC::Int
  alias FlowBoxForeachFunc = Pointer(LibGtk::FlowBox), Pointer(LibGtk::FlowBoxChild), Pointer(Void) -> Void
  alias FlowBoxSortFunc = Pointer(LibGtk::FlowBoxChild), Pointer(LibGtk::FlowBoxChild), Pointer(Void) -> Int32
  alias FontFilterFunc = Pointer(LibPango::FontFamily), Pointer(LibPango::FontFace), Pointer(Void) -> LibC::Int
  alias IconViewForeachFunc = Pointer(LibGtk::IconView), Pointer(LibGtk::TreePath), Pointer(Void) -> Void
  alias ListBoxCreateWidgetFunc = Pointer(LibGObject::Object), Pointer(Void) -> Pointer(LibGtk::Widget)
  alias ListBoxFilterFunc = Pointer(LibGtk::ListBoxRow), Pointer(Void) -> LibC::Int
  alias ListBoxForeachFunc = Pointer(LibGtk::ListBox), Pointer(LibGtk::ListBoxRow), Pointer(Void) -> Void
  alias ListBoxSortFunc = Pointer(LibGtk::ListBoxRow), Pointer(LibGtk::ListBoxRow), Pointer(Void) -> Int32
  alias ListBoxUpdateHeaderFunc = Pointer(LibGtk::ListBoxRow), Pointer(LibGtk::ListBoxRow), Pointer(Void) -> Void
  alias MapListModelMapFunc = Pointer(LibGObject::Object), Pointer(Void) -> Pointer(LibGObject::Object)
  alias MenuButtonCreatePopupFunc = Pointer(LibGtk::MenuButton), Pointer(Void) -> Void
  alias PageSetupDoneFunc = Pointer(LibGtk::PageSetup), Pointer(Void) -> Void
  alias PrintJobCompleteFunc = Pointer(LibGtk::PrintJob), Pointer(Void), Pointer(Void) -> Void
  alias PrintSettingsFunc = Pointer(LibC::Char), Pointer(LibC::Char), Pointer(Void) -> Void
  alias PrinterFunc = Pointer(LibGtk::Printer), Pointer(Void) -> LibC::Int
  alias ScaleFormatValueFunc = Pointer(LibGtk::Scale), Float64, Pointer(Void) -> Pointer(LibC::Char)
  alias ShortcutFunc = Pointer(LibGtk::Widget), Pointer(LibGLib::Variant), Pointer(Void) -> LibC::Int
  alias TextCharPredicate = UInt32, Pointer(Void) -> LibC::Int
  alias TextTagTableForeach = Pointer(LibGtk::TextTag), Pointer(Void) -> Void
  alias TickCallback = Pointer(LibGtk::Widget), Pointer(LibGdk::FrameClock), Pointer(Void) -> LibC::Int
  alias TreeCellDataFunc = Pointer(LibGtk::TreeViewColumn), Pointer(LibGtk::CellRenderer), Pointer(LibGtk::TreeModel), Pointer(LibGtk::TreeIter), Pointer(Void) -> Void
  alias TreeIterCompareFunc = Pointer(LibGtk::TreeModel), Pointer(LibGtk::TreeIter), Pointer(LibGtk::TreeIter), Pointer(Void) -> Int32
  alias TreeListModelCreateModelFunc = Pointer(LibGObject::Object), Pointer(Void) -> Pointer(LibGio::ListModel)
  alias TreeModelFilterModifyFunc = Pointer(LibGtk::TreeModel), Pointer(LibGtk::TreeIter), LibGObject::Value, Int32, Pointer(Void) -> Void
  alias TreeModelFilterVisibleFunc = Pointer(LibGtk::TreeModel), Pointer(LibGtk::TreeIter), Pointer(Void) -> LibC::Int
  alias TreeModelForeachFunc = Pointer(LibGtk::TreeModel), Pointer(LibGtk::TreePath), Pointer(LibGtk::TreeIter), Pointer(Void) -> LibC::Int
  alias TreeSelectionForeachFunc = Pointer(LibGtk::TreeModel), Pointer(LibGtk::TreePath), Pointer(LibGtk::TreeIter), Pointer(Void) -> Void
  alias TreeSelectionFunc = Pointer(LibGtk::TreeSelection), Pointer(LibGtk::TreeModel), Pointer(LibGtk::TreePath), LibC::Int, Pointer(Void) -> LibC::Int
  alias TreeViewColumnDropFunc = Pointer(LibGtk::TreeView), Pointer(LibGtk::TreeViewColumn), Pointer(LibGtk::TreeViewColumn), Pointer(LibGtk::TreeViewColumn), Pointer(Void) -> LibC::Int
  alias TreeViewMappingFunc = Pointer(LibGtk::TreeView), Pointer(LibGtk::TreePath), Pointer(Void) -> Void
  alias TreeViewRowSeparatorFunc = Pointer(LibGtk::TreeModel), Pointer(LibGtk::TreeIter), Pointer(Void) -> LibC::Int
  alias TreeViewSearchEqualFunc = Pointer(LibGtk::TreeModel), Int32, Pointer(LibC::Char), Pointer(LibGtk::TreeIter), Pointer(Void) -> LibC::Int
  alias WidgetActionActivateFunc = Pointer(LibGtk::Widget), Pointer(LibC::Char), Pointer(LibGLib::Variant) -> Void

  # Interface types
  type Accessible = Void
  type Actionable = Void
  type AppChooser = Void
  type Buildable = Void
  type BuilderScope = Void
  type CellEditable = Void
  type CellLayout = Void
  type ColorChooser = Void
  type ConstraintTarget = Void
  type Editable = Void
  type FileChooser = Void
  type FontChooser = Void
  type Native = Void
  type Orientable = Void
  type PrintOperationPreview = Void
  type Root = Void
  type Scrollable = Void
  type SelectionModel = Void
  type ShortcutManager = Void
  type StyleProvider = Void
  type TreeDragDest = Void
  type TreeDragSource = Void
  type TreeModel = Void
  type TreeSortable = Void

  # Structs

  type Bitset = Void # Struct with zero bytes

  struct BitsetIter # 80 bytes long
    private_data : Pointer(Void)[10]
  end

  struct Border # 8 bytes long
    left : Int16
    right : Int16
    top : Int16
    bottom : Int16
  end

  type BuildableParseContext = Void # Struct with zero bytes

  struct BuildableParser # 64 bytes long
    start_element : -> Void
    end_element : -> Void
    text : -> Void
    error : -> Void
    padding : Pointer(Void)[4]
  end

  type ButtonPrivate = Void # Struct with zero bytes

  type CellAreaContextPrivate = Void # Struct with zero bytes

  type CellRendererClassPrivate = Void # Struct with zero bytes

  type CellRendererPrivate = Void # Struct with zero bytes

  struct CssLocation # 40 bytes long
    bytes : UInt64
    chars : UInt64
    lines : UInt64
    line_bytes : UInt64
    line_chars : UInt64
  end

  type CssProviderPrivate = Void # Struct with zero bytes

  type CssSection = Void # Struct with zero bytes

  type CssStyleChange = Void # Struct with zero bytes

  type ExpressionWatch = Void # Struct with zero bytes

  type IMContextSimplePrivate = Void # Struct with zero bytes

  type IMMulticontextPrivate = Void # Struct with zero bytes

  type ListStorePrivate = Void # Struct with zero bytes

  type MountOperationPrivate = Void # Struct with zero bytes

  struct PadActionEntry # 32 bytes long
    type : UInt32
    index : Int32
    mode : Int32
    label : Pointer(LibC::Char)
    action_name : Pointer(LibC::Char)
  end

  struct PageRange # 8 bytes long
    start : Int32
    _end : Int32
  end

  type PaperSize = Void # Struct with zero bytes

  type PrintBackend = Void # Struct with zero bytes

  type PrintOperationPrivate = Void # Struct with zero bytes

  struct RecentData # 56 bytes long
    display_name : Pointer(LibC::Char)
    description : Pointer(LibC::Char)
    mime_type : Pointer(LibC::Char)
    app_name : Pointer(LibC::Char)
    app_exec : Pointer(LibC::Char)
    groups : Pointer(Pointer(LibC::Char))
    is_private : LibC::Int
  end

  type RecentInfo = Void # Struct with zero bytes

  type RecentManagerPrivate = Void # Struct with zero bytes

  struct RequestedSize # 16 bytes long
    data : Pointer(Void)
    minimum_size : Int32
    natural_size : Int32
  end

  struct Requisition # 8 bytes long
    width : Int32
    height : Int32
  end

  type TextBufferPrivate = Void # Struct with zero bytes

  struct TextIter # 80 bytes long
    dummy1 : Pointer(Void)
    dummy2 : Pointer(Void)
    dummy3 : Int32
    dummy4 : Int32
    dummy5 : Int32
    dummy6 : Int32
    dummy7 : Int32
    dummy8 : Int32
    dummy9 : Pointer(Void)
    dummy10 : Pointer(Void)
    dummy11 : Int32
    dummy12 : Int32
    dummy13 : Int32
    dummy14 : Pointer(Void)
  end

  type TextTagPrivate = Void # Struct with zero bytes

  type TextViewPrivate = Void # Struct with zero bytes

  struct TreeIter # 32 bytes long
    stamp : Int32
    user_data : Pointer(Void)
    user_data2 : Pointer(Void)
    user_data3 : Pointer(Void)
  end

  type TreeModelFilterPrivate = Void # Struct with zero bytes

  type TreeModelSortPrivate = Void # Struct with zero bytes

  type TreePath = Void # Struct with zero bytes

  type TreeRowReference = Void # Struct with zero bytes

  type TreeStorePrivate = Void # Struct with zero bytes

  type WidgetClassPrivate = Void # Struct with zero bytes

  type WidgetPrivate = Void # Struct with zero bytes

  type WindowGroupPrivate = Void # Struct with zero bytes

  # Unions

  # Objects
  type ATContext = Void # Object struct with no fields

  type AboutDialog = Void # Object struct with no fields

  type ActionBar = Void # Object struct with no fields

  type ActivateAction = Void # Object struct with no fields

  struct Adjustment
    parent_instance : LibGObject::InitiallyUnowned
  end

  type AlternativeTrigger = Void # Object struct with no fields

  type AnyFilter = Void # Object struct with no fields

  type AppChooserButton = Void # Object struct with no fields

  type AppChooserDialog = Void # Object struct with no fields

  type AppChooserWidget = Void # Object struct with no fields

  struct Application
    parent_instance : LibGio::Application
  end

  struct ApplicationWindow
    parent_instance : LibGtk::Window
  end

  type AspectFrame = Void # Object struct with no fields

  type Assistant = Void # Object struct with no fields

  type AssistantPage = Void # Object struct with no fields

  type BinLayout = Void # Object struct with no fields

  type BookmarkList = Void # Object struct with no fields

  type BoolFilter = Void # Object struct with no fields

  struct Box
    parent_instance : LibGtk::Widget
  end

  type BoxLayout = Void # Object struct with no fields

  type Builder = Void # Object struct with no fields

  struct BuilderCScope
    parent_instance : LibGObject::Object
  end

  type BuilderListItemFactory = Void # Object struct with no fields

  struct Button
    parent_instance : LibGtk::Widget
  end

  type CClosureExpression = Void # Object struct with no fields

  type Calendar = Void # Object struct with no fields

  type CallbackAction = Void # Object struct with no fields

  struct CellArea
    parent_instance : LibGObject::InitiallyUnowned
  end

  type CellAreaBox = Void # Object struct with no fields

  struct CellAreaContext
    parent_instance : LibGObject::Object
  end

  struct CellRenderer
    parent_instance : LibGObject::InitiallyUnowned
    priv : Pointer(LibGtk::CellRendererPrivate)
  end

  type CellRendererAccel = Void # Object struct with no fields

  type CellRendererCombo = Void # Object struct with no fields

  type CellRendererPixbuf = Void # Object struct with no fields

  type CellRendererProgress = Void # Object struct with no fields

  type CellRendererSpin = Void # Object struct with no fields

  type CellRendererSpinner = Void # Object struct with no fields

  struct CellRendererText
    parent : LibGtk::CellRenderer
  end

  type CellRendererToggle = Void # Object struct with no fields

  type CellView = Void # Object struct with no fields

  type CenterBox = Void # Object struct with no fields

  type CenterLayout = Void # Object struct with no fields

  struct CheckButton
    parent_instance : LibGtk::Widget
  end

  type ClosureExpression = Void # Object struct with no fields

  type ColorButton = Void # Object struct with no fields

  type ColorChooserDialog = Void # Object struct with no fields

  type ColorChooserWidget = Void # Object struct with no fields

  type ColumnView = Void # Object struct with no fields

  type ColumnViewColumn = Void # Object struct with no fields

  struct ComboBox
    parent_instance : LibGtk::Widget
  end

  type ComboBoxText = Void # Object struct with no fields

  type ConstantExpression = Void # Object struct with no fields

  type Constraint = Void # Object struct with no fields

  type ConstraintGuide = Void # Object struct with no fields

  type ConstraintLayout = Void # Object struct with no fields

  type ConstraintLayoutChild = Void # Object struct with no fields

  struct CssProvider
    parent_instance : LibGObject::Object
  end

  type CustomFilter = Void # Object struct with no fields

  type CustomLayout = Void # Object struct with no fields

  type CustomSorter = Void # Object struct with no fields

  struct Dialog
    parent_instance : LibGtk::Window
  end

  type DirectoryList = Void # Object struct with no fields

  type DragIcon = Void # Object struct with no fields

  type DragSource = Void # Object struct with no fields

  struct DrawingArea
    widget : LibGtk::Widget
  end

  type DropControllerMotion = Void # Object struct with no fields

  type DropDown = Void # Object struct with no fields

  type DropTarget = Void # Object struct with no fields

  type DropTargetAsync = Void # Object struct with no fields

  type EditableLabel = Void # Object struct with no fields

  type EmojiChooser = Void # Object struct with no fields

  struct Entry
    parent_instance : LibGtk::Widget
  end

  struct EntryBuffer
    parent_instance : LibGObject::Object
  end

  type EntryCompletion = Void # Object struct with no fields

  type EventController = Void # Object struct with no fields

  type EventControllerFocus = Void # Object struct with no fields

  type EventControllerKey = Void # Object struct with no fields

  type EventControllerLegacy = Void # Object struct with no fields

  type EventControllerMotion = Void # Object struct with no fields

  type EventControllerScroll = Void # Object struct with no fields

  type EveryFilter = Void # Object struct with no fields

  type Expander = Void # Object struct with no fields

  type Expression = Void # Object struct with no fields

  type FileChooserDialog = Void # Object struct with no fields

  type FileChooserNative = Void # Object struct with no fields

  type FileChooserWidget = Void # Object struct with no fields

  type FileFilter = Void # Object struct with no fields

  struct Filter
    parent_instance : LibGObject::Object
  end

  type FilterListModel = Void # Object struct with no fields

  struct Fixed
    parent_instance : LibGtk::Widget
  end

  type FixedLayout = Void # Object struct with no fields

  type FixedLayoutChild = Void # Object struct with no fields

  type FlattenListModel = Void # Object struct with no fields

  type FlowBox = Void # Object struct with no fields

  struct FlowBoxChild
    parent_instance : LibGtk::Widget
  end

  type FontButton = Void # Object struct with no fields

  type FontChooserDialog = Void # Object struct with no fields

  type FontChooserWidget = Void # Object struct with no fields

  struct Frame
    parent_instance : LibGtk::Widget
  end

  struct GLArea
    parent_instance : LibGtk::Widget
  end

  type Gesture = Void # Object struct with no fields

  type GestureClick = Void # Object struct with no fields

  type GestureDrag = Void # Object struct with no fields

  type GestureLongPress = Void # Object struct with no fields

  type GesturePan = Void # Object struct with no fields

  type GestureRotate = Void # Object struct with no fields

  type GestureSingle = Void # Object struct with no fields

  type GestureStylus = Void # Object struct with no fields

  type GestureSwipe = Void # Object struct with no fields

  type GestureZoom = Void # Object struct with no fields

  struct Grid
    parent_instance : LibGtk::Widget
  end

  type GridLayout = Void # Object struct with no fields

  type GridLayoutChild = Void # Object struct with no fields

  type GridView = Void # Object struct with no fields

  type HeaderBar = Void # Object struct with no fields

  struct IMContext
    parent_instance : LibGObject::Object
  end

  struct IMContextSimple
    object : LibGtk::IMContext
    priv : Pointer(LibGtk::IMContextSimplePrivate)
  end

  struct IMMulticontext
    object : LibGtk::IMContext
    priv : Pointer(LibGtk::IMMulticontextPrivate)
  end

  type IconPaintable = Void # Object struct with no fields

  type IconTheme = Void # Object struct with no fields

  type IconView = Void # Object struct with no fields

  type Image = Void # Object struct with no fields

  type InfoBar = Void # Object struct with no fields

  type KeyvalTrigger = Void # Object struct with no fields

  type Label = Void # Object struct with no fields

  struct LayoutChild
    parent_instance : LibGObject::Object
  end

  struct LayoutManager
    parent_instance : LibGObject::Object
  end

  type LevelBar = Void # Object struct with no fields

  type LinkButton = Void # Object struct with no fields

  type ListBase = Void # Object struct with no fields

  type ListBox = Void # Object struct with no fields

  struct ListBoxRow
    parent_instance : LibGtk::Widget
  end

  type ListItem = Void # Object struct with no fields

  type ListItemFactory = Void # Object struct with no fields

  struct ListStore
    parent : LibGObject::Object
    priv : Pointer(LibGtk::ListStorePrivate)
  end

  type ListView = Void # Object struct with no fields

  type LockButton = Void # Object struct with no fields

  type MapListModel = Void # Object struct with no fields

  type MediaControls = Void # Object struct with no fields

  struct MediaFile
    parent_instance : LibGtk::MediaStream
  end

  struct MediaStream
    parent_instance : LibGObject::Object
  end

  type MenuButton = Void # Object struct with no fields

  struct MessageDialog
    parent_instance : LibGtk::Dialog
  end

  type MnemonicAction = Void # Object struct with no fields

  type MnemonicTrigger = Void # Object struct with no fields

  struct MountOperation
    parent_instance : LibGio::MountOperation
    priv : Pointer(LibGtk::MountOperationPrivate)
  end

  type MultiFilter = Void # Object struct with no fields

  type MultiSelection = Void # Object struct with no fields

  type MultiSorter = Void # Object struct with no fields

  type NamedAction = Void # Object struct with no fields

  struct NativeDialog
    parent_instance : LibGObject::Object
  end

  type NeverTrigger = Void # Object struct with no fields

  type NoSelection = Void # Object struct with no fields

  type Notebook = Void # Object struct with no fields

  type NotebookPage = Void # Object struct with no fields

  type NothingAction = Void # Object struct with no fields

  type NumericSorter = Void # Object struct with no fields

  type ObjectExpression = Void # Object struct with no fields

  type Overlay = Void # Object struct with no fields

  type OverlayLayout = Void # Object struct with no fields

  type OverlayLayoutChild = Void # Object struct with no fields

  type PadController = Void # Object struct with no fields

  type PageSetup = Void # Object struct with no fields

  type PageSetupUnixDialog = Void # Object struct with no fields

  type Paned = Void # Object struct with no fields

  struct ParamSpecExpression
    parent_instance : LibGObject::ParamSpec
  end

  type PasswordEntry = Void # Object struct with no fields

  type PasswordEntryBuffer = Void # Object struct with no fields

  type Picture = Void # Object struct with no fields

  struct Popover
    parent : LibGtk::Widget
  end

  type PopoverMenu = Void # Object struct with no fields

  type PopoverMenuBar = Void # Object struct with no fields

  type PrintContext = Void # Object struct with no fields

  type PrintJob = Void # Object struct with no fields

  struct PrintOperation
    parent_instance : LibGObject::Object
    priv : Pointer(LibGtk::PrintOperationPrivate)
  end

  type PrintSettings = Void # Object struct with no fields

  type PrintUnixDialog = Void # Object struct with no fields

  type Printer = Void # Object struct with no fields

  type ProgressBar = Void # Object struct with no fields

  type PropertyExpression = Void # Object struct with no fields

  struct Range
    parent_instance : LibGtk::Widget
  end

  struct RecentManager
    parent_instance : LibGObject::Object
    priv : Pointer(LibGtk::RecentManagerPrivate)
  end

  type Revealer = Void # Object struct with no fields

  struct Scale
    parent_instance : LibGtk::Range
  end

  struct ScaleButton
    parent_instance : LibGtk::Widget
  end

  type Scrollbar = Void # Object struct with no fields

  type ScrolledWindow = Void # Object struct with no fields

  type SearchBar = Void # Object struct with no fields

  type SearchEntry = Void # Object struct with no fields

  type SelectionFilterModel = Void # Object struct with no fields

  type Separator = Void # Object struct with no fields

  type Settings = Void # Object struct with no fields

  type Shortcut = Void # Object struct with no fields

  type ShortcutAction = Void # Object struct with no fields

  type ShortcutController = Void # Object struct with no fields

  type ShortcutLabel = Void # Object struct with no fields

  type ShortcutTrigger = Void # Object struct with no fields

  type ShortcutsGroup = Void # Object struct with no fields

  type ShortcutsSection = Void # Object struct with no fields

  type ShortcutsShortcut = Void # Object struct with no fields

  type ShortcutsWindow = Void # Object struct with no fields

  type SignalAction = Void # Object struct with no fields

  type SignalListItemFactory = Void # Object struct with no fields

  type SingleSelection = Void # Object struct with no fields

  struct SizeGroup
    parent_instance : LibGObject::Object
  end

  type SliceListModel = Void # Object struct with no fields

  type Snapshot = Void # Object struct with no fields

  type SortListModel = Void # Object struct with no fields

  struct Sorter
    parent_instance : LibGObject::Object
  end

  type SpinButton = Void # Object struct with no fields

  type Spinner = Void # Object struct with no fields

  type Stack = Void # Object struct with no fields

  type StackPage = Void # Object struct with no fields

  type StackSidebar = Void # Object struct with no fields

  type StackSwitcher = Void # Object struct with no fields

  type Statusbar = Void # Object struct with no fields

  type StringFilter = Void # Object struct with no fields

  type StringList = Void # Object struct with no fields

  type StringObject = Void # Object struct with no fields

  type StringSorter = Void # Object struct with no fields

  struct StyleContext
    parent_object : LibGObject::Object
  end

  type Switch = Void # Object struct with no fields

  struct Text
    parent_instance : LibGtk::Widget
  end

  struct TextBuffer
    parent_instance : LibGObject::Object
    priv : Pointer(LibGtk::TextBufferPrivate)
  end

  struct TextChildAnchor
    parent_instance : LibGObject::Object
    segment : Pointer(Void)
  end

  struct TextMark
    parent_instance : LibGObject::Object
    segment : Pointer(Void)
  end

  struct TextTag
    parent_instance : LibGObject::Object
    priv : Pointer(LibGtk::TextTagPrivate)
  end

  type TextTagTable = Void # Object struct with no fields

  struct TextView
    parent_instance : LibGtk::Widget
    priv : Pointer(LibGtk::TextViewPrivate)
  end

  struct ToggleButton
    button : LibGtk::Button
  end

  type Tooltip = Void # Object struct with no fields

  type TreeExpander = Void # Object struct with no fields

  type TreeListModel = Void # Object struct with no fields

  type TreeListRow = Void # Object struct with no fields

  type TreeListRowSorter = Void # Object struct with no fields

  struct TreeModelFilter
    parent : LibGObject::Object
    priv : Pointer(LibGtk::TreeModelFilterPrivate)
  end

  struct TreeModelSort
    parent : LibGObject::Object
    priv : Pointer(LibGtk::TreeModelSortPrivate)
  end

  type TreeSelection = Void # Object struct with no fields

  struct TreeStore
    parent : LibGObject::Object
    priv : Pointer(LibGtk::TreeStorePrivate)
  end

  struct TreeView
    parent_instance : LibGtk::Widget
  end

  type TreeViewColumn = Void # Object struct with no fields

  type Video = Void # Object struct with no fields

  type Viewport = Void # Object struct with no fields

  struct VolumeButton
    parent : LibGtk::ScaleButton
  end

  struct Widget
    parent_instance : LibGObject::InitiallyUnowned
    priv : Pointer(LibGtk::WidgetPrivate)
  end

  type WidgetPaintable = Void # Object struct with no fields

  struct Window
    parent_instance : LibGtk::Widget
  end

  type WindowControls = Void # Object struct with no fields

  struct WindowGroup
    parent_instance : LibGObject::Object
    priv : Pointer(LibGtk::WindowGroupPrivate)
  end

  type WindowHandle = Void # Object struct with no fields

  # All C Functions
  fun gtk_about_dialog_add_credit_section(this : Void*, section_name : Pointer(LibC::Char), people : Pointer(Pointer(LibC::Char))) : Void
  fun gtk_about_dialog_get_artists(this : Void*) : Pointer(Pointer(LibC::Char))
  fun gtk_about_dialog_get_authors(this : Void*) : Pointer(Pointer(LibC::Char))
  fun gtk_about_dialog_get_comments(this : Void*) : Pointer(LibC::Char)
  fun gtk_about_dialog_get_copyright(this : Void*) : Pointer(LibC::Char)
  fun gtk_about_dialog_get_documenters(this : Void*) : Pointer(Pointer(LibC::Char))
  fun gtk_about_dialog_get_license(this : Void*) : Pointer(LibC::Char)
  fun gtk_about_dialog_get_license_type(this : Void*) : UInt32
  fun gtk_about_dialog_get_logo(this : Void*) : Pointer(Void)
  fun gtk_about_dialog_get_logo_icon_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_about_dialog_get_program_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_about_dialog_get_system_information(this : Void*) : Pointer(LibC::Char)
  fun gtk_about_dialog_get_translator_credits(this : Void*) : Pointer(LibC::Char)
  fun gtk_about_dialog_get_type : UInt64
  fun gtk_about_dialog_get_version(this : Void*) : Pointer(LibC::Char)
  fun gtk_about_dialog_get_website(this : Void*) : Pointer(LibC::Char)
  fun gtk_about_dialog_get_website_label(this : Void*) : Pointer(LibC::Char)
  fun gtk_about_dialog_get_wrap_license(this : Void*) : LibC::Int
  fun gtk_about_dialog_new : Pointer(Void)
  fun gtk_about_dialog_set_artists(this : Void*, artists : Pointer(Pointer(LibC::Char))) : Void
  fun gtk_about_dialog_set_authors(this : Void*, authors : Pointer(Pointer(LibC::Char))) : Void
  fun gtk_about_dialog_set_comments(this : Void*, comments : Pointer(LibC::Char)) : Void
  fun gtk_about_dialog_set_copyright(this : Void*, copyright : Pointer(LibC::Char)) : Void
  fun gtk_about_dialog_set_documenters(this : Void*, documenters : Pointer(Pointer(LibC::Char))) : Void
  fun gtk_about_dialog_set_license(this : Void*, license : Pointer(LibC::Char)) : Void
  fun gtk_about_dialog_set_license_type(this : Void*, license_type : UInt32) : Void
  fun gtk_about_dialog_set_logo(this : Void*, logo : Pointer(Void)) : Void
  fun gtk_about_dialog_set_logo_icon_name(this : Void*, icon_name : Pointer(LibC::Char)) : Void
  fun gtk_about_dialog_set_program_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun gtk_about_dialog_set_system_information(this : Void*, system_information : Pointer(LibC::Char)) : Void
  fun gtk_about_dialog_set_translator_credits(this : Void*, translator_credits : Pointer(LibC::Char)) : Void
  fun gtk_about_dialog_set_version(this : Void*, version : Pointer(LibC::Char)) : Void
  fun gtk_about_dialog_set_website(this : Void*, website : Pointer(LibC::Char)) : Void
  fun gtk_about_dialog_set_website_label(this : Void*, website_label : Pointer(LibC::Char)) : Void
  fun gtk_about_dialog_set_wrap_license(this : Void*, wrap_license : LibC::Int) : Void
  fun gtk_accelerator_get_default_mod_mask : UInt32
  fun gtk_accelerator_get_label(accelerator_key : UInt32, accelerator_mods : UInt32) : Pointer(LibC::Char)
  fun gtk_accelerator_get_label_with_keycode(display : Pointer(Void), accelerator_key : UInt32, keycode : UInt32, accelerator_mods : UInt32) : Pointer(LibC::Char)
  fun gtk_accelerator_name(accelerator_key : UInt32, accelerator_mods : UInt32) : Pointer(LibC::Char)
  fun gtk_accelerator_name_with_keycode(display : Pointer(Void), accelerator_key : UInt32, keycode : UInt32, accelerator_mods : UInt32) : Pointer(LibC::Char)
  fun gtk_accelerator_parse(accelerator : Pointer(LibC::Char), accelerator_key : Pointer(UInt32), accelerator_mods : Pointer(UInt32)) : LibC::Int
  fun gtk_accelerator_parse_with_keycode(accelerator : Pointer(LibC::Char), display : Pointer(Void), accelerator_key : Pointer(UInt32), accelerator_codes : Pointer(Pointer(UInt32)), accelerator_mods : Pointer(UInt32)) : LibC::Int
  fun gtk_accelerator_valid(keyval : UInt32, modifiers : UInt32) : LibC::Int
  fun gtk_accessible_get_accessible_role(this : Void*) : UInt32
  fun gtk_accessible_get_type : UInt64
  fun gtk_accessible_property_init_value(property : UInt32, value : Pointer(Void)) : Void
  fun gtk_accessible_relation_init_value(relation : UInt32, value : Pointer(Void)) : Void
  fun gtk_accessible_reset_property(this : Void*, property : UInt32) : Void
  fun gtk_accessible_reset_relation(this : Void*, relation : UInt32) : Void
  fun gtk_accessible_reset_state(this : Void*, state : UInt32) : Void
  fun gtk_accessible_state_init_value(state : UInt32, value : Pointer(Void)) : Void
  fun gtk_accessible_update_property_value(this : Void*, n_properties : Int32, properties : Pointer(UInt32), values : Pointer(Void)) : Void
  fun gtk_accessible_update_relation_value(this : Void*, n_relations : Int32, relations : Pointer(UInt32), values : Pointer(Void)) : Void
  fun gtk_accessible_update_state_value(this : Void*, n_states : Int32, states : Pointer(UInt32), values : Pointer(Void)) : Void
  fun gtk_action_bar_get_center_widget(this : Void*) : Pointer(Void)
  fun gtk_action_bar_get_revealed(this : Void*) : LibC::Int
  fun gtk_action_bar_get_type : UInt64
  fun gtk_action_bar_new : Pointer(Void)
  fun gtk_action_bar_pack_end(this : Void*, child : Pointer(Void)) : Void
  fun gtk_action_bar_pack_start(this : Void*, child : Pointer(Void)) : Void
  fun gtk_action_bar_remove(this : Void*, child : Pointer(Void)) : Void
  fun gtk_action_bar_set_center_widget(this : Void*, center_widget : Pointer(Void)) : Void
  fun gtk_action_bar_set_revealed(this : Void*, revealed : LibC::Int) : Void
  fun gtk_actionable_get_action_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_actionable_get_action_target_value(this : Void*) : Pointer(Void)
  fun gtk_actionable_get_type : UInt64
  fun gtk_actionable_set_action_name(this : Void*, action_name : Pointer(LibC::Char)) : Void
  fun gtk_actionable_set_action_target_value(this : Void*, target_value : Pointer(Void)) : Void
  fun gtk_actionable_set_detailed_action_name(this : Void*, detailed_action_name : Pointer(LibC::Char)) : Void
  fun gtk_activate_action_get : Pointer(Void)
  fun gtk_activate_action_get_type : UInt64
  fun gtk_adjustment_clamp_page(this : Void*, lower : Float64, upper : Float64) : Void
  fun gtk_adjustment_configure(this : Void*, value : Float64, lower : Float64, upper : Float64, step_increment : Float64, page_increment : Float64, page_size : Float64) : Void
  fun gtk_adjustment_get_lower(this : Void*) : Float64
  fun gtk_adjustment_get_minimum_increment(this : Void*) : Float64
  fun gtk_adjustment_get_page_increment(this : Void*) : Float64
  fun gtk_adjustment_get_page_size(this : Void*) : Float64
  fun gtk_adjustment_get_step_increment(this : Void*) : Float64
  fun gtk_adjustment_get_type : UInt64
  fun gtk_adjustment_get_upper(this : Void*) : Float64
  fun gtk_adjustment_get_value(this : Void*) : Float64
  fun gtk_adjustment_new(value : Float64, lower : Float64, upper : Float64, step_increment : Float64, page_increment : Float64, page_size : Float64) : Pointer(Void)
  fun gtk_adjustment_set_lower(this : Void*, lower : Float64) : Void
  fun gtk_adjustment_set_page_increment(this : Void*, page_increment : Float64) : Void
  fun gtk_adjustment_set_page_size(this : Void*, page_size : Float64) : Void
  fun gtk_adjustment_set_step_increment(this : Void*, step_increment : Float64) : Void
  fun gtk_adjustment_set_upper(this : Void*, upper : Float64) : Void
  fun gtk_adjustment_set_value(this : Void*, value : Float64) : Void
  fun gtk_alternative_trigger_get_first(this : Void*) : Pointer(Void)
  fun gtk_alternative_trigger_get_second(this : Void*) : Pointer(Void)
  fun gtk_alternative_trigger_get_type : UInt64
  fun gtk_alternative_trigger_new(first : Pointer(Void), second : Pointer(Void)) : Pointer(Void)
  fun gtk_any_filter_get_type : UInt64
  fun gtk_any_filter_new : Pointer(Void)
  fun gtk_app_chooser_button_append_custom_item(this : Void*, name : Pointer(LibC::Char), label : Pointer(LibC::Char), icon : Pointer(Void)) : Void
  fun gtk_app_chooser_button_append_separator(this : Void*) : Void
  fun gtk_app_chooser_button_get_heading(this : Void*) : Pointer(LibC::Char)
  fun gtk_app_chooser_button_get_modal(this : Void*) : LibC::Int
  fun gtk_app_chooser_button_get_show_default_item(this : Void*) : LibC::Int
  fun gtk_app_chooser_button_get_show_dialog_item(this : Void*) : LibC::Int
  fun gtk_app_chooser_button_get_type : UInt64
  fun gtk_app_chooser_button_new(content_type : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_app_chooser_button_set_active_custom_item(this : Void*, name : Pointer(LibC::Char)) : Void
  fun gtk_app_chooser_button_set_heading(this : Void*, heading : Pointer(LibC::Char)) : Void
  fun gtk_app_chooser_button_set_modal(this : Void*, modal : LibC::Int) : Void
  fun gtk_app_chooser_button_set_show_default_item(this : Void*, setting : LibC::Int) : Void
  fun gtk_app_chooser_button_set_show_dialog_item(this : Void*, setting : LibC::Int) : Void
  fun gtk_app_chooser_dialog_get_heading(this : Void*) : Pointer(LibC::Char)
  fun gtk_app_chooser_dialog_get_type : UInt64
  fun gtk_app_chooser_dialog_get_widget(this : Void*) : Pointer(Void)
  fun gtk_app_chooser_dialog_new(parent : Pointer(Void), flags : UInt32, file : Pointer(Void)) : Pointer(Void)
  fun gtk_app_chooser_dialog_new_for_content_type(parent : Pointer(Void), flags : UInt32, content_type : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_app_chooser_dialog_set_heading(this : Void*, heading : Pointer(LibC::Char)) : Void
  fun gtk_app_chooser_get_app_info(this : Void*) : Pointer(Void)
  fun gtk_app_chooser_get_content_type(this : Void*) : Pointer(LibC::Char)
  fun gtk_app_chooser_get_type : UInt64
  fun gtk_app_chooser_refresh(this : Void*) : Void
  fun gtk_app_chooser_widget_get_default_text(this : Void*) : Pointer(LibC::Char)
  fun gtk_app_chooser_widget_get_show_all(this : Void*) : LibC::Int
  fun gtk_app_chooser_widget_get_show_default(this : Void*) : LibC::Int
  fun gtk_app_chooser_widget_get_show_fallback(this : Void*) : LibC::Int
  fun gtk_app_chooser_widget_get_show_other(this : Void*) : LibC::Int
  fun gtk_app_chooser_widget_get_show_recommended(this : Void*) : LibC::Int
  fun gtk_app_chooser_widget_get_type : UInt64
  fun gtk_app_chooser_widget_new(content_type : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_app_chooser_widget_set_default_text(this : Void*, text : Pointer(LibC::Char)) : Void
  fun gtk_app_chooser_widget_set_show_all(this : Void*, setting : LibC::Int) : Void
  fun gtk_app_chooser_widget_set_show_default(this : Void*, setting : LibC::Int) : Void
  fun gtk_app_chooser_widget_set_show_fallback(this : Void*, setting : LibC::Int) : Void
  fun gtk_app_chooser_widget_set_show_other(this : Void*, setting : LibC::Int) : Void
  fun gtk_app_chooser_widget_set_show_recommended(this : Void*, setting : LibC::Int) : Void
  fun gtk_application_add_window(this : Void*, window : Pointer(Void)) : Void
  fun gtk_application_get_accels_for_action(this : Void*, detailed_action_name : Pointer(LibC::Char)) : Pointer(Pointer(LibC::Char))
  fun gtk_application_get_actions_for_accel(this : Void*, accel : Pointer(LibC::Char)) : Pointer(Pointer(LibC::Char))
  fun gtk_application_get_active_window(this : Void*) : Pointer(Void)
  fun gtk_application_get_menu_by_id(this : Void*, id : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_application_get_menubar(this : Void*) : Pointer(Void)
  fun gtk_application_get_type : UInt64
  fun gtk_application_get_window_by_id(this : Void*, id : UInt32) : Pointer(Void)
  fun gtk_application_get_windows(this : Void*) : Pointer(LibGLib::List)
  fun gtk_application_inhibit(this : Void*, window : Pointer(Void), flags : UInt32, reason : Pointer(LibC::Char)) : UInt32
  fun gtk_application_list_action_descriptions(this : Void*) : Pointer(Pointer(LibC::Char))
  fun gtk_application_new(application_id : Pointer(LibC::Char), flags : UInt32) : Pointer(Void)
  fun gtk_application_remove_window(this : Void*, window : Pointer(Void)) : Void
  fun gtk_application_set_accels_for_action(this : Void*, detailed_action_name : Pointer(LibC::Char), accels : Pointer(Pointer(LibC::Char))) : Void
  fun gtk_application_set_menubar(this : Void*, menubar : Pointer(Void)) : Void
  fun gtk_application_uninhibit(this : Void*, cookie : UInt32) : Void
  fun gtk_application_window_get_help_overlay(this : Void*) : Pointer(Void)
  fun gtk_application_window_get_id(this : Void*) : UInt32
  fun gtk_application_window_get_show_menubar(this : Void*) : LibC::Int
  fun gtk_application_window_get_type : UInt64
  fun gtk_application_window_new(application : Pointer(Void)) : Pointer(Void)
  fun gtk_application_window_set_help_overlay(this : Void*, help_overlay : Pointer(Void)) : Void
  fun gtk_application_window_set_show_menubar(this : Void*, show_menubar : LibC::Int) : Void
  fun gtk_aspect_frame_get_child(this : Void*) : Pointer(Void)
  fun gtk_aspect_frame_get_obey_child(this : Void*) : LibC::Int
  fun gtk_aspect_frame_get_ratio(this : Void*) : Float32
  fun gtk_aspect_frame_get_type : UInt64
  fun gtk_aspect_frame_get_xalign(this : Void*) : Float32
  fun gtk_aspect_frame_get_yalign(this : Void*) : Float32
  fun gtk_aspect_frame_new(xalign : Float32, yalign : Float32, ratio : Float32, obey_child : LibC::Int) : Pointer(Void)
  fun gtk_aspect_frame_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_aspect_frame_set_obey_child(this : Void*, obey_child : LibC::Int) : Void
  fun gtk_aspect_frame_set_ratio(this : Void*, ratio : Float32) : Void
  fun gtk_aspect_frame_set_xalign(this : Void*, xalign : Float32) : Void
  fun gtk_aspect_frame_set_yalign(this : Void*, yalign : Float32) : Void
  fun gtk_assistant_add_action_widget(this : Void*, child : Pointer(Void)) : Void
  fun gtk_assistant_append_page(this : Void*, page : Pointer(Void)) : Int32
  fun gtk_assistant_commit(this : Void*) : Void
  fun gtk_assistant_get_current_page(this : Void*) : Int32
  fun gtk_assistant_get_n_pages(this : Void*) : Int32
  fun gtk_assistant_get_nth_page(this : Void*, page_num : Int32) : Pointer(Void)
  fun gtk_assistant_get_page(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun gtk_assistant_get_page_complete(this : Void*, page : Pointer(Void)) : LibC::Int
  fun gtk_assistant_get_page_title(this : Void*, page : Pointer(Void)) : Pointer(LibC::Char)
  fun gtk_assistant_get_page_type(this : Void*, page : Pointer(Void)) : UInt32
  fun gtk_assistant_get_pages(this : Void*) : Pointer(Void)
  fun gtk_assistant_get_type : UInt64
  fun gtk_assistant_insert_page(this : Void*, page : Pointer(Void), position : Int32) : Int32
  fun gtk_assistant_new : Pointer(Void)
  fun gtk_assistant_next_page(this : Void*) : Void
  fun gtk_assistant_page_get_child(this : Void*) : Pointer(Void)
  fun gtk_assistant_page_get_type : UInt64
  fun gtk_assistant_prepend_page(this : Void*, page : Pointer(Void)) : Int32
  fun gtk_assistant_previous_page(this : Void*) : Void
  fun gtk_assistant_remove_action_widget(this : Void*, child : Pointer(Void)) : Void
  fun gtk_assistant_remove_page(this : Void*, page_num : Int32) : Void
  fun gtk_assistant_set_current_page(this : Void*, page_num : Int32) : Void
  fun gtk_assistant_set_forward_page_func(this : Void*, page_func : AssistantPageFunc, data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_assistant_set_page_complete(this : Void*, page : Pointer(Void), complete : LibC::Int) : Void
  fun gtk_assistant_set_page_title(this : Void*, page : Pointer(Void), title : Pointer(LibC::Char)) : Void
  fun gtk_assistant_set_page_type(this : Void*, page : Pointer(Void), type : UInt32) : Void
  fun gtk_assistant_update_buttons_state(this : Void*) : Void
  fun gtk_at_context_create(accessible_role : UInt32, accessible : Pointer(Void), display : Pointer(Void)) : Pointer(Void)
  fun gtk_at_context_get_accessible(this : Void*) : Pointer(Void)
  fun gtk_at_context_get_accessible_role(this : Void*) : UInt32
  fun gtk_at_context_get_type : UInt64
  fun gtk_bin_layout_get_type : UInt64
  fun gtk_bin_layout_new : Pointer(Void)
  fun gtk_bitset_add(this : Void*, value : UInt32) : LibC::Int
  fun gtk_bitset_add_range(this : Void*, start : UInt32, n_items : UInt32) : Void
  fun gtk_bitset_add_range_closed(this : Void*, first : UInt32, last : UInt32) : Void
  fun gtk_bitset_add_rectangle(this : Void*, start : UInt32, width : UInt32, height : UInt32, stride : UInt32) : Void
  fun gtk_bitset_contains(this : Void*, value : UInt32) : LibC::Int
  fun gtk_bitset_copy(this : Void*) : Pointer(Void)
  fun gtk_bitset_difference(this : Void*, other : Pointer(Void)) : Void
  fun gtk_bitset_equals(this : Void*, other : Pointer(Void)) : LibC::Int
  fun gtk_bitset_get_maximum(this : Void*) : UInt32
  fun gtk_bitset_get_minimum(this : Void*) : UInt32
  fun gtk_bitset_get_nth(this : Void*, nth : UInt32) : UInt32
  fun gtk_bitset_get_size(this : Void*) : UInt64
  fun gtk_bitset_get_size_in_range(this : Void*, first : UInt32, last : UInt32) : UInt64
  fun gtk_bitset_get_type : UInt64
  fun gtk_bitset_intersect(this : Void*, other : Pointer(Void)) : Void
  fun gtk_bitset_is_empty(this : Void*) : LibC::Int
  fun gtk_bitset_iter_get_value(this : Void*) : UInt32
  fun gtk_bitset_iter_init_at(iter : Pointer(Void), set : Pointer(Void), target : UInt32, value : Pointer(UInt32)) : LibC::Int
  fun gtk_bitset_iter_init_at(iter : Pointer(Void), set : Pointer(Void), target : UInt32, value : Pointer(UInt32)) : LibC::Int
  fun gtk_bitset_iter_init_first(iter : Pointer(Void), set : Pointer(Void), value : Pointer(UInt32)) : LibC::Int
  fun gtk_bitset_iter_init_first(iter : Pointer(Void), set : Pointer(Void), value : Pointer(UInt32)) : LibC::Int
  fun gtk_bitset_iter_init_last(iter : Pointer(Void), set : Pointer(Void), value : Pointer(UInt32)) : LibC::Int
  fun gtk_bitset_iter_init_last(iter : Pointer(Void), set : Pointer(Void), value : Pointer(UInt32)) : LibC::Int
  fun gtk_bitset_iter_is_valid(this : Void*) : LibC::Int
  fun gtk_bitset_iter_next(this : Void*, value : Pointer(UInt32)) : LibC::Int
  fun gtk_bitset_iter_previous(this : Void*, value : Pointer(UInt32)) : LibC::Int
  fun gtk_bitset_new_empty : Pointer(Void)
  fun gtk_bitset_new_range(start : UInt32, n_items : UInt32) : Pointer(Void)
  fun gtk_bitset_ref(this : Void*) : Pointer(Void)
  fun gtk_bitset_remove(this : Void*, value : UInt32) : LibC::Int
  fun gtk_bitset_remove_all(this : Void*) : Void
  fun gtk_bitset_remove_range(this : Void*, start : UInt32, n_items : UInt32) : Void
  fun gtk_bitset_remove_range_closed(this : Void*, first : UInt32, last : UInt32) : Void
  fun gtk_bitset_remove_rectangle(this : Void*, start : UInt32, width : UInt32, height : UInt32, stride : UInt32) : Void
  fun gtk_bitset_shift_left(this : Void*, amount : UInt32) : Void
  fun gtk_bitset_shift_right(this : Void*, amount : UInt32) : Void
  fun gtk_bitset_splice(this : Void*, position : UInt32, removed : UInt32, added : UInt32) : Void
  fun gtk_bitset_subtract(this : Void*, other : Pointer(Void)) : Void
  fun gtk_bitset_union(this : Void*, other : Pointer(Void)) : Void
  fun gtk_bitset_unref(this : Void*) : Void
  fun gtk_bookmark_list_get_attributes(this : Void*) : Pointer(LibC::Char)
  fun gtk_bookmark_list_get_filename(this : Void*) : Pointer(LibC::Char)
  fun gtk_bookmark_list_get_io_priority(this : Void*) : Int32
  fun gtk_bookmark_list_get_type : UInt64
  fun gtk_bookmark_list_is_loading(this : Void*) : LibC::Int
  fun gtk_bookmark_list_new(filename : Pointer(LibC::Char), attributes : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_bookmark_list_set_attributes(this : Void*, attributes : Pointer(LibC::Char)) : Void
  fun gtk_bookmark_list_set_io_priority(this : Void*, io_priority : Int32) : Void
  fun gtk_bool_filter_get_expression(this : Void*) : Pointer(Void)
  fun gtk_bool_filter_get_invert(this : Void*) : LibC::Int
  fun gtk_bool_filter_get_type : UInt64
  fun gtk_bool_filter_new(expression : Pointer(Void)) : Pointer(Void)
  fun gtk_bool_filter_set_expression(this : Void*, expression : Pointer(Void)) : Void
  fun gtk_bool_filter_set_invert(this : Void*, invert : LibC::Int) : Void
  fun gtk_border_copy(this : Void*) : Pointer(Void)
  fun gtk_border_free(this : Void*) : Void
  fun gtk_border_get_type : UInt64
  fun gtk_border_new : Pointer(Void)
  fun gtk_box_append(this : Void*, child : Pointer(Void)) : Void
  fun gtk_box_get_baseline_position(this : Void*) : UInt32
  fun gtk_box_get_homogeneous(this : Void*) : LibC::Int
  fun gtk_box_get_spacing(this : Void*) : Int32
  fun gtk_box_get_type : UInt64
  fun gtk_box_insert_child_after(this : Void*, child : Pointer(Void), sibling : Pointer(Void)) : Void
  fun gtk_box_layout_get_baseline_position(this : Void*) : UInt32
  fun gtk_box_layout_get_homogeneous(this : Void*) : LibC::Int
  fun gtk_box_layout_get_spacing(this : Void*) : UInt32
  fun gtk_box_layout_get_type : UInt64
  fun gtk_box_layout_new(orientation : UInt32) : Pointer(Void)
  fun gtk_box_layout_set_baseline_position(this : Void*, position : UInt32) : Void
  fun gtk_box_layout_set_homogeneous(this : Void*, homogeneous : LibC::Int) : Void
  fun gtk_box_layout_set_spacing(this : Void*, spacing : UInt32) : Void
  fun gtk_box_new(orientation : UInt32, spacing : Int32) : Pointer(Void)
  fun gtk_box_prepend(this : Void*, child : Pointer(Void)) : Void
  fun gtk_box_remove(this : Void*, child : Pointer(Void)) : Void
  fun gtk_box_reorder_child_after(this : Void*, child : Pointer(Void), sibling : Pointer(Void)) : Void
  fun gtk_box_set_baseline_position(this : Void*, position : UInt32) : Void
  fun gtk_box_set_homogeneous(this : Void*, homogeneous : LibC::Int) : Void
  fun gtk_box_set_spacing(this : Void*, spacing : Int32) : Void
  fun gtk_buildable_get_buildable_id(this : Void*) : Pointer(LibC::Char)
  fun gtk_buildable_get_type : UInt64
  fun gtk_buildable_parse_context_get_element(this : Void*) : Pointer(LibC::Char)
  fun gtk_buildable_parse_context_get_element_stack(this : Void*) : Pointer(Pointer(LibC::Char))
  fun gtk_buildable_parse_context_get_position(this : Void*, line_number : Pointer(Int32), char_number : Pointer(Int32)) : Void
  fun gtk_buildable_parse_context_pop(this : Void*) : Pointer(Void)
  fun gtk_buildable_parse_context_push(this : Void*, parser : Pointer(Void), user_data : Pointer(Void)) : Void
  fun gtk_builder_add_from_file(this : Void*, filename : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun gtk_builder_add_from_resource(this : Void*, resource_path : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun gtk_builder_add_from_string(this : Void*, buffer : Pointer(LibC::Char), length : Int64, error : LibGLib::Error**) : LibC::Int
  fun gtk_builder_add_objects_from_file(this : Void*, filename : Pointer(LibC::Char), object_ids : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun gtk_builder_add_objects_from_resource(this : Void*, resource_path : Pointer(LibC::Char), object_ids : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun gtk_builder_add_objects_from_string(this : Void*, buffer : Pointer(LibC::Char), length : Int64, object_ids : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun gtk_builder_create_closure(this : Void*, function_name : Pointer(LibC::Char), flags : UInt32, object : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun gtk_builder_cscope_add_callback_symbol(this : Void*, callback_name : Pointer(LibC::Char), callback_symbol : LibGObject::Callback) : Void
  fun gtk_builder_cscope_get_type : UInt64
  fun gtk_builder_cscope_new : Pointer(Void)
  fun gtk_builder_error_quark : UInt32
  fun gtk_builder_expose_object(this : Void*, name : Pointer(LibC::Char), object : Pointer(Void)) : Void
  fun gtk_builder_extend_with_template(this : Void*, object : Pointer(Void), template_type : UInt64, buffer : Pointer(LibC::Char), length : Int64, error : LibGLib::Error**) : LibC::Int
  fun gtk_builder_get_current_object(this : Void*) : Pointer(Void)
  fun gtk_builder_get_object(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_builder_get_objects(this : Void*) : Pointer(LibGLib::SList)
  fun gtk_builder_get_scope(this : Void*) : Pointer(Void)
  fun gtk_builder_get_translation_domain(this : Void*) : Pointer(LibC::Char)
  fun gtk_builder_get_type : UInt64
  fun gtk_builder_get_type_from_name(this : Void*, type_name : Pointer(LibC::Char)) : UInt64
  fun gtk_builder_list_item_factory_get_bytes(this : Void*) : Pointer(Void)
  fun gtk_builder_list_item_factory_get_resource(this : Void*) : Pointer(LibC::Char)
  fun gtk_builder_list_item_factory_get_scope(this : Void*) : Pointer(Void)
  fun gtk_builder_list_item_factory_get_type : UInt64
  fun gtk_builder_list_item_factory_new_from_bytes(scope : Pointer(Void), bytes : Pointer(Void)) : Pointer(Void)
  fun gtk_builder_list_item_factory_new_from_resource(scope : Pointer(Void), resource_path : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_builder_new : Pointer(Void)
  fun gtk_builder_new_from_file(filename : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_builder_new_from_resource(resource_path : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_builder_new_from_string(string : Pointer(LibC::Char), length : Int64) : Pointer(Void)
  fun gtk_builder_scope_get_type : UInt64
  fun gtk_builder_set_current_object(this : Void*, current_object : Pointer(Void)) : Void
  fun gtk_builder_set_scope(this : Void*, scope : Pointer(Void)) : Void
  fun gtk_builder_set_translation_domain(this : Void*, domain : Pointer(LibC::Char)) : Void
  fun gtk_builder_value_from_string(this : Void*, pspec : Pointer(Void), string : Pointer(LibC::Char), value : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gtk_builder_value_from_string_type(this : Void*, type : UInt64, string : Pointer(LibC::Char), value : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gtk_button_get_child(this : Void*) : Pointer(Void)
  fun gtk_button_get_has_frame(this : Void*) : LibC::Int
  fun gtk_button_get_icon_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_button_get_label(this : Void*) : Pointer(LibC::Char)
  fun gtk_button_get_type : UInt64
  fun gtk_button_get_use_underline(this : Void*) : LibC::Int
  fun gtk_button_new : Pointer(Void)
  fun gtk_button_new_from_icon_name(icon_name : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_button_new_with_label(label : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_button_new_with_mnemonic(label : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_button_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_button_set_has_frame(this : Void*, has_frame : LibC::Int) : Void
  fun gtk_button_set_icon_name(this : Void*, icon_name : Pointer(LibC::Char)) : Void
  fun gtk_button_set_label(this : Void*, label : Pointer(LibC::Char)) : Void
  fun gtk_button_set_use_underline(this : Void*, use_underline : LibC::Int) : Void
  fun gtk_calendar_clear_marks(this : Void*) : Void
  fun gtk_calendar_get_date(this : Void*) : Pointer(Void)
  fun gtk_calendar_get_day_is_marked(this : Void*, day : UInt32) : LibC::Int
  fun gtk_calendar_get_show_day_names(this : Void*) : LibC::Int
  fun gtk_calendar_get_show_heading(this : Void*) : LibC::Int
  fun gtk_calendar_get_show_week_numbers(this : Void*) : LibC::Int
  fun gtk_calendar_get_type : UInt64
  fun gtk_calendar_mark_day(this : Void*, day : UInt32) : Void
  fun gtk_calendar_new : Pointer(Void)
  fun gtk_calendar_select_day(this : Void*, date : Pointer(Void)) : Void
  fun gtk_calendar_set_show_day_names(this : Void*, value : LibC::Int) : Void
  fun gtk_calendar_set_show_heading(this : Void*, value : LibC::Int) : Void
  fun gtk_calendar_set_show_week_numbers(this : Void*, value : LibC::Int) : Void
  fun gtk_calendar_unmark_day(this : Void*, day : UInt32) : Void
  fun gtk_callback_action_get_type : UInt64
  fun gtk_callback_action_new(callback : ShortcutFunc, data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Pointer(Void)
  fun gtk_cclosure_expression_get_type : UInt64
  fun gtk_cclosure_expression_new(value_type : UInt64, marshal : LibGObject::ClosureMarshal, n_params : UInt32, params : Pointer(Pointer(Void)), callback_func : LibGObject::Callback, user_data : Pointer(Void), user_destroy : LibGObject::ClosureNotify) : Pointer(Void)
  fun gtk_cell_area_activate(this : Void*, context : Pointer(Void), widget : Pointer(Void), cell_area : Pointer(Void), flags : UInt32, edit_only : LibC::Int) : LibC::Int
  fun gtk_cell_area_activate_cell(this : Void*, widget : Pointer(Void), renderer : Pointer(Void), event : Pointer(Void), cell_area : Pointer(Void), flags : UInt32) : LibC::Int
  fun gtk_cell_area_add(this : Void*, renderer : Pointer(Void)) : Void
  fun gtk_cell_area_add_focus_sibling(this : Void*, renderer : Pointer(Void), sibling : Pointer(Void)) : Void
  fun gtk_cell_area_apply_attributes(this : Void*, tree_model : Pointer(Void), iter : Pointer(Void), is_expander : LibC::Int, is_expanded : LibC::Int) : Void
  fun gtk_cell_area_attribute_connect(this : Void*, renderer : Pointer(Void), attribute : Pointer(LibC::Char), column : Int32) : Void
  fun gtk_cell_area_attribute_disconnect(this : Void*, renderer : Pointer(Void), attribute : Pointer(LibC::Char)) : Void
  fun gtk_cell_area_attribute_get_column(this : Void*, renderer : Pointer(Void), attribute : Pointer(LibC::Char)) : Int32
  fun gtk_cell_area_box_get_spacing(this : Void*) : Int32
  fun gtk_cell_area_box_get_type : UInt64
  fun gtk_cell_area_box_new : Pointer(Void)
  fun gtk_cell_area_box_pack_end(this : Void*, renderer : Pointer(Void), expand : LibC::Int, align : LibC::Int, fixed : LibC::Int) : Void
  fun gtk_cell_area_box_pack_start(this : Void*, renderer : Pointer(Void), expand : LibC::Int, align : LibC::Int, fixed : LibC::Int) : Void
  fun gtk_cell_area_box_set_spacing(this : Void*, spacing : Int32) : Void
  fun gtk_cell_area_cell_get_property(this : Void*, renderer : Pointer(Void), property_name : Pointer(LibC::Char), value : Pointer(Void)) : Void
  fun gtk_cell_area_cell_set_property(this : Void*, renderer : Pointer(Void), property_name : Pointer(LibC::Char), value : Pointer(Void)) : Void
  fun gtk_cell_area_class_find_cell_property(this : Void*, property_name : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_cell_area_class_install_cell_property(this : Void*, property_id : UInt32, pspec : Pointer(Void)) : Void
  fun gtk_cell_area_class_list_cell_properties(this : Void*, n_properties : Pointer(UInt32)) : Pointer(Pointer(Void))
  fun gtk_cell_area_context_allocate(this : Void*, width : Int32, height : Int32) : Void
  fun gtk_cell_area_context_get_allocation(this : Void*, width : Pointer(Int32), height : Pointer(Int32)) : Void
  fun gtk_cell_area_context_get_area(this : Void*) : Pointer(Void)
  fun gtk_cell_area_context_get_preferred_height(this : Void*, minimum_height : Pointer(Int32), natural_height : Pointer(Int32)) : Void
  fun gtk_cell_area_context_get_preferred_height_for_width(this : Void*, width : Int32, minimum_height : Pointer(Int32), natural_height : Pointer(Int32)) : Void
  fun gtk_cell_area_context_get_preferred_width(this : Void*, minimum_width : Pointer(Int32), natural_width : Pointer(Int32)) : Void
  fun gtk_cell_area_context_get_preferred_width_for_height(this : Void*, height : Int32, minimum_width : Pointer(Int32), natural_width : Pointer(Int32)) : Void
  fun gtk_cell_area_context_get_type : UInt64
  fun gtk_cell_area_context_push_preferred_height(this : Void*, minimum_height : Int32, natural_height : Int32) : Void
  fun gtk_cell_area_context_push_preferred_width(this : Void*, minimum_width : Int32, natural_width : Int32) : Void
  fun gtk_cell_area_context_reset(this : Void*) : Void
  fun gtk_cell_area_copy_context(this : Void*, context : Pointer(Void)) : Pointer(Void)
  fun gtk_cell_area_create_context(this : Void*) : Pointer(Void)
  fun gtk_cell_area_event(this : Void*, context : Pointer(Void), widget : Pointer(Void), event : Pointer(Void), cell_area : Pointer(Void), flags : UInt32) : Int32
  fun gtk_cell_area_focus(this : Void*, direction : UInt32) : LibC::Int
  fun gtk_cell_area_foreach(this : Void*, callback : CellCallback, callback_data : Pointer(Void)) : Void
  fun gtk_cell_area_foreach_alloc(this : Void*, context : Pointer(Void), widget : Pointer(Void), cell_area : Pointer(Void), background_area : Pointer(Void), callback : CellAllocCallback, callback_data : Pointer(Void)) : Void
  fun gtk_cell_area_get_cell_allocation(this : Void*, context : Pointer(Void), widget : Pointer(Void), renderer : Pointer(Void), cell_area : Pointer(Void), allocation : Pointer(Void)) : Void
  fun gtk_cell_area_get_cell_at_position(this : Void*, context : Pointer(Void), widget : Pointer(Void), cell_area : Pointer(Void), x : Int32, y : Int32, alloc_area : Pointer(Void)) : Pointer(Void)
  fun gtk_cell_area_get_current_path_string(this : Void*) : Pointer(LibC::Char)
  fun gtk_cell_area_get_edit_widget(this : Void*) : Pointer(Void)
  fun gtk_cell_area_get_edited_cell(this : Void*) : Pointer(Void)
  fun gtk_cell_area_get_focus_cell(this : Void*) : Pointer(Void)
  fun gtk_cell_area_get_focus_from_sibling(this : Void*, renderer : Pointer(Void)) : Pointer(Void)
  fun gtk_cell_area_get_focus_siblings(this : Void*, renderer : Pointer(Void)) : Pointer(LibGLib::List)
  fun gtk_cell_area_get_preferred_height(this : Void*, context : Pointer(Void), widget : Pointer(Void), minimum_height : Pointer(Int32), natural_height : Pointer(Int32)) : Void
  fun gtk_cell_area_get_preferred_height_for_width(this : Void*, context : Pointer(Void), widget : Pointer(Void), width : Int32, minimum_height : Pointer(Int32), natural_height : Pointer(Int32)) : Void
  fun gtk_cell_area_get_preferred_width(this : Void*, context : Pointer(Void), widget : Pointer(Void), minimum_width : Pointer(Int32), natural_width : Pointer(Int32)) : Void
  fun gtk_cell_area_get_preferred_width_for_height(this : Void*, context : Pointer(Void), widget : Pointer(Void), height : Int32, minimum_width : Pointer(Int32), natural_width : Pointer(Int32)) : Void
  fun gtk_cell_area_get_request_mode(this : Void*) : UInt32
  fun gtk_cell_area_get_type : UInt64
  fun gtk_cell_area_has_renderer(this : Void*, renderer : Pointer(Void)) : LibC::Int
  fun gtk_cell_area_inner_cell_area(this : Void*, widget : Pointer(Void), cell_area : Pointer(Void), inner_area : Pointer(Void)) : Void
  fun gtk_cell_area_is_activatable(this : Void*) : LibC::Int
  fun gtk_cell_area_is_focus_sibling(this : Void*, renderer : Pointer(Void), sibling : Pointer(Void)) : LibC::Int
  fun gtk_cell_area_remove(this : Void*, renderer : Pointer(Void)) : Void
  fun gtk_cell_area_remove_focus_sibling(this : Void*, renderer : Pointer(Void), sibling : Pointer(Void)) : Void
  fun gtk_cell_area_request_renderer(this : Void*, renderer : Pointer(Void), orientation : UInt32, widget : Pointer(Void), for_size : Int32, minimum_size : Pointer(Int32), natural_size : Pointer(Int32)) : Void
  fun gtk_cell_area_set_focus_cell(this : Void*, renderer : Pointer(Void)) : Void
  fun gtk_cell_area_snapshot(this : Void*, context : Pointer(Void), widget : Pointer(Void), snapshot : Pointer(Void), background_area : Pointer(Void), cell_area : Pointer(Void), flags : UInt32, paint_focus : LibC::Int) : Void
  fun gtk_cell_area_stop_editing(this : Void*, canceled : LibC::Int) : Void
  fun gtk_cell_editable_editing_done(this : Void*) : Void
  fun gtk_cell_editable_get_type : UInt64
  fun gtk_cell_editable_remove_widget(this : Void*) : Void
  fun gtk_cell_editable_start_editing(this : Void*, event : Pointer(Void)) : Void
  fun gtk_cell_layout_add_attribute(this : Void*, cell : Pointer(Void), attribute : Pointer(LibC::Char), column : Int32) : Void
  fun gtk_cell_layout_clear(this : Void*) : Void
  fun gtk_cell_layout_clear_attributes(this : Void*, cell : Pointer(Void)) : Void
  fun gtk_cell_layout_get_area(this : Void*) : Pointer(Void)
  fun gtk_cell_layout_get_cells(this : Void*) : Pointer(LibGLib::List)
  fun gtk_cell_layout_get_type : UInt64
  fun gtk_cell_layout_pack_end(this : Void*, cell : Pointer(Void), expand : LibC::Int) : Void
  fun gtk_cell_layout_pack_start(this : Void*, cell : Pointer(Void), expand : LibC::Int) : Void
  fun gtk_cell_layout_reorder(this : Void*, cell : Pointer(Void), position : Int32) : Void
  fun gtk_cell_layout_set_cell_data_func(this : Void*, cell : Pointer(Void), func : CellLayoutDataFunc, func_data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_cell_renderer_accel_get_type : UInt64
  fun gtk_cell_renderer_accel_new : Pointer(Void)
  fun gtk_cell_renderer_activate(this : Void*, event : Pointer(Void), widget : Pointer(Void), path : Pointer(LibC::Char), background_area : Pointer(Void), cell_area : Pointer(Void), flags : UInt32) : LibC::Int
  fun gtk_cell_renderer_combo_get_type : UInt64
  fun gtk_cell_renderer_combo_new : Pointer(Void)
  fun gtk_cell_renderer_get_aligned_area(this : Void*, widget : Pointer(Void), flags : UInt32, cell_area : Pointer(Void), aligned_area : Pointer(Void)) : Void
  fun gtk_cell_renderer_get_alignment(this : Void*, xalign : Pointer(Float32), yalign : Pointer(Float32)) : Void
  fun gtk_cell_renderer_get_fixed_size(this : Void*, width : Pointer(Int32), height : Pointer(Int32)) : Void
  fun gtk_cell_renderer_get_is_expanded(this : Void*) : LibC::Int
  fun gtk_cell_renderer_get_is_expander(this : Void*) : LibC::Int
  fun gtk_cell_renderer_get_padding(this : Void*, xpad : Pointer(Int32), ypad : Pointer(Int32)) : Void
  fun gtk_cell_renderer_get_preferred_height(this : Void*, widget : Pointer(Void), minimum_size : Pointer(Int32), natural_size : Pointer(Int32)) : Void
  fun gtk_cell_renderer_get_preferred_height_for_width(this : Void*, widget : Pointer(Void), width : Int32, minimum_height : Pointer(Int32), natural_height : Pointer(Int32)) : Void
  fun gtk_cell_renderer_get_preferred_size(this : Void*, widget : Pointer(Void), minimum_size : Pointer(Void), natural_size : Pointer(Void)) : Void
  fun gtk_cell_renderer_get_preferred_width(this : Void*, widget : Pointer(Void), minimum_size : Pointer(Int32), natural_size : Pointer(Int32)) : Void
  fun gtk_cell_renderer_get_preferred_width_for_height(this : Void*, widget : Pointer(Void), height : Int32, minimum_width : Pointer(Int32), natural_width : Pointer(Int32)) : Void
  fun gtk_cell_renderer_get_request_mode(this : Void*) : UInt32
  fun gtk_cell_renderer_get_sensitive(this : Void*) : LibC::Int
  fun gtk_cell_renderer_get_state(this : Void*, widget : Pointer(Void), cell_state : UInt32) : UInt32
  fun gtk_cell_renderer_get_type : UInt64
  fun gtk_cell_renderer_get_visible(this : Void*) : LibC::Int
  fun gtk_cell_renderer_is_activatable(this : Void*) : LibC::Int
  fun gtk_cell_renderer_pixbuf_get_type : UInt64
  fun gtk_cell_renderer_pixbuf_new : Pointer(Void)
  fun gtk_cell_renderer_progress_get_type : UInt64
  fun gtk_cell_renderer_progress_new : Pointer(Void)
  fun gtk_cell_renderer_set_alignment(this : Void*, xalign : Float32, yalign : Float32) : Void
  fun gtk_cell_renderer_set_fixed_size(this : Void*, width : Int32, height : Int32) : Void
  fun gtk_cell_renderer_set_is_expanded(this : Void*, is_expanded : LibC::Int) : Void
  fun gtk_cell_renderer_set_is_expander(this : Void*, is_expander : LibC::Int) : Void
  fun gtk_cell_renderer_set_padding(this : Void*, xpad : Int32, ypad : Int32) : Void
  fun gtk_cell_renderer_set_sensitive(this : Void*, sensitive : LibC::Int) : Void
  fun gtk_cell_renderer_set_visible(this : Void*, visible : LibC::Int) : Void
  fun gtk_cell_renderer_snapshot(this : Void*, snapshot : Pointer(Void), widget : Pointer(Void), background_area : Pointer(Void), cell_area : Pointer(Void), flags : UInt32) : Void
  fun gtk_cell_renderer_spin_get_type : UInt64
  fun gtk_cell_renderer_spin_new : Pointer(Void)
  fun gtk_cell_renderer_spinner_get_type : UInt64
  fun gtk_cell_renderer_spinner_new : Pointer(Void)
  fun gtk_cell_renderer_start_editing(this : Void*, event : Pointer(Void), widget : Pointer(Void), path : Pointer(LibC::Char), background_area : Pointer(Void), cell_area : Pointer(Void), flags : UInt32) : Pointer(Void)
  fun gtk_cell_renderer_stop_editing(this : Void*, canceled : LibC::Int) : Void
  fun gtk_cell_renderer_text_get_type : UInt64
  fun gtk_cell_renderer_text_new : Pointer(Void)
  fun gtk_cell_renderer_text_set_fixed_height_from_font(this : Void*, number_of_rows : Int32) : Void
  fun gtk_cell_renderer_toggle_get_activatable(this : Void*) : LibC::Int
  fun gtk_cell_renderer_toggle_get_active(this : Void*) : LibC::Int
  fun gtk_cell_renderer_toggle_get_radio(this : Void*) : LibC::Int
  fun gtk_cell_renderer_toggle_get_type : UInt64
  fun gtk_cell_renderer_toggle_new : Pointer(Void)
  fun gtk_cell_renderer_toggle_set_activatable(this : Void*, setting : LibC::Int) : Void
  fun gtk_cell_renderer_toggle_set_active(this : Void*, setting : LibC::Int) : Void
  fun gtk_cell_renderer_toggle_set_radio(this : Void*, radio : LibC::Int) : Void
  fun gtk_cell_view_get_displayed_row(this : Void*) : Pointer(Void)
  fun gtk_cell_view_get_draw_sensitive(this : Void*) : LibC::Int
  fun gtk_cell_view_get_fit_model(this : Void*) : LibC::Int
  fun gtk_cell_view_get_model(this : Void*) : Pointer(Void)
  fun gtk_cell_view_get_type : UInt64
  fun gtk_cell_view_new : Pointer(Void)
  fun gtk_cell_view_new_with_context(area : Pointer(Void), context : Pointer(Void)) : Pointer(Void)
  fun gtk_cell_view_new_with_markup(markup : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_cell_view_new_with_text(text : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_cell_view_new_with_texture(texture : Pointer(Void)) : Pointer(Void)
  fun gtk_cell_view_set_displayed_row(this : Void*, path : Pointer(Void)) : Void
  fun gtk_cell_view_set_draw_sensitive(this : Void*, draw_sensitive : LibC::Int) : Void
  fun gtk_cell_view_set_fit_model(this : Void*, fit_model : LibC::Int) : Void
  fun gtk_cell_view_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_center_box_get_baseline_position(this : Void*) : UInt32
  fun gtk_center_box_get_center_widget(this : Void*) : Pointer(Void)
  fun gtk_center_box_get_end_widget(this : Void*) : Pointer(Void)
  fun gtk_center_box_get_start_widget(this : Void*) : Pointer(Void)
  fun gtk_center_box_get_type : UInt64
  fun gtk_center_box_new : Pointer(Void)
  fun gtk_center_box_set_baseline_position(this : Void*, position : UInt32) : Void
  fun gtk_center_box_set_center_widget(this : Void*, child : Pointer(Void)) : Void
  fun gtk_center_box_set_end_widget(this : Void*, child : Pointer(Void)) : Void
  fun gtk_center_box_set_start_widget(this : Void*, child : Pointer(Void)) : Void
  fun gtk_center_layout_get_baseline_position(this : Void*) : UInt32
  fun gtk_center_layout_get_center_widget(this : Void*) : Pointer(Void)
  fun gtk_center_layout_get_end_widget(this : Void*) : Pointer(Void)
  fun gtk_center_layout_get_orientation(this : Void*) : UInt32
  fun gtk_center_layout_get_start_widget(this : Void*) : Pointer(Void)
  fun gtk_center_layout_get_type : UInt64
  fun gtk_center_layout_new : Pointer(Void)
  fun gtk_center_layout_set_baseline_position(this : Void*, baseline_position : UInt32) : Void
  fun gtk_center_layout_set_center_widget(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_center_layout_set_end_widget(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_center_layout_set_orientation(this : Void*, orientation : UInt32) : Void
  fun gtk_center_layout_set_start_widget(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_check_button_get_active(this : Void*) : LibC::Int
  fun gtk_check_button_get_inconsistent(this : Void*) : LibC::Int
  fun gtk_check_button_get_label(this : Void*) : Pointer(LibC::Char)
  fun gtk_check_button_get_type : UInt64
  fun gtk_check_button_get_use_underline(this : Void*) : LibC::Int
  fun gtk_check_button_new : Pointer(Void)
  fun gtk_check_button_new_with_label(label : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_check_button_new_with_mnemonic(label : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_check_button_set_active(this : Void*, setting : LibC::Int) : Void
  fun gtk_check_button_set_group(this : Void*, group : Pointer(Void)) : Void
  fun gtk_check_button_set_inconsistent(this : Void*, inconsistent : LibC::Int) : Void
  fun gtk_check_button_set_label(this : Void*, label : Pointer(LibC::Char)) : Void
  fun gtk_check_button_set_use_underline(this : Void*, setting : LibC::Int) : Void
  fun gtk_check_version(required_major : UInt32, required_minor : UInt32, required_micro : UInt32) : Pointer(LibC::Char)
  fun gtk_closure_expression_get_type : UInt64
  fun gtk_closure_expression_new(value_type : UInt64, closure : Pointer(Void), n_params : UInt32, params : Pointer(Pointer(Void))) : Pointer(Void)
  fun gtk_color_button_get_modal(this : Void*) : LibC::Int
  fun gtk_color_button_get_title(this : Void*) : Pointer(LibC::Char)
  fun gtk_color_button_get_type : UInt64
  fun gtk_color_button_new : Pointer(Void)
  fun gtk_color_button_new_with_rgba(rgba : Pointer(Void)) : Pointer(Void)
  fun gtk_color_button_set_modal(this : Void*, modal : LibC::Int) : Void
  fun gtk_color_button_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun gtk_color_chooser_add_palette(this : Void*, orientation : UInt32, colors_per_line : Int32, n_colors : Int32, colors : Pointer(Void)) : Void
  fun gtk_color_chooser_dialog_get_type : UInt64
  fun gtk_color_chooser_dialog_new(title : Pointer(LibC::Char), parent : Pointer(Void)) : Pointer(Void)
  fun gtk_color_chooser_get_rgba(this : Void*, color : Pointer(Void)) : Void
  fun gtk_color_chooser_get_type : UInt64
  fun gtk_color_chooser_get_use_alpha(this : Void*) : LibC::Int
  fun gtk_color_chooser_set_rgba(this : Void*, color : Pointer(Void)) : Void
  fun gtk_color_chooser_set_use_alpha(this : Void*, use_alpha : LibC::Int) : Void
  fun gtk_color_chooser_widget_get_type : UInt64
  fun gtk_color_chooser_widget_new : Pointer(Void)
  fun gtk_column_view_append_column(this : Void*, column : Pointer(Void)) : Void
  fun gtk_column_view_column_get_column_view(this : Void*) : Pointer(Void)
  fun gtk_column_view_column_get_expand(this : Void*) : LibC::Int
  fun gtk_column_view_column_get_factory(this : Void*) : Pointer(Void)
  fun gtk_column_view_column_get_fixed_width(this : Void*) : Int32
  fun gtk_column_view_column_get_header_menu(this : Void*) : Pointer(Void)
  fun gtk_column_view_column_get_resizable(this : Void*) : LibC::Int
  fun gtk_column_view_column_get_sorter(this : Void*) : Pointer(Void)
  fun gtk_column_view_column_get_title(this : Void*) : Pointer(LibC::Char)
  fun gtk_column_view_column_get_type : UInt64
  fun gtk_column_view_column_get_visible(this : Void*) : LibC::Int
  fun gtk_column_view_column_new(title : Pointer(LibC::Char), factory : Pointer(Void)) : Pointer(Void)
  fun gtk_column_view_column_set_expand(this : Void*, expand : LibC::Int) : Void
  fun gtk_column_view_column_set_factory(this : Void*, factory : Pointer(Void)) : Void
  fun gtk_column_view_column_set_fixed_width(this : Void*, fixed_width : Int32) : Void
  fun gtk_column_view_column_set_header_menu(this : Void*, menu : Pointer(Void)) : Void
  fun gtk_column_view_column_set_resizable(this : Void*, resizable : LibC::Int) : Void
  fun gtk_column_view_column_set_sorter(this : Void*, sorter : Pointer(Void)) : Void
  fun gtk_column_view_column_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun gtk_column_view_column_set_visible(this : Void*, visible : LibC::Int) : Void
  fun gtk_column_view_get_columns(this : Void*) : Pointer(Void)
  fun gtk_column_view_get_enable_rubberband(this : Void*) : LibC::Int
  fun gtk_column_view_get_model(this : Void*) : Pointer(Void)
  fun gtk_column_view_get_reorderable(this : Void*) : LibC::Int
  fun gtk_column_view_get_show_column_separators(this : Void*) : LibC::Int
  fun gtk_column_view_get_show_row_separators(this : Void*) : LibC::Int
  fun gtk_column_view_get_single_click_activate(this : Void*) : LibC::Int
  fun gtk_column_view_get_sorter(this : Void*) : Pointer(Void)
  fun gtk_column_view_get_type : UInt64
  fun gtk_column_view_insert_column(this : Void*, position : UInt32, column : Pointer(Void)) : Void
  fun gtk_column_view_new(model : Pointer(Void)) : Pointer(Void)
  fun gtk_column_view_remove_column(this : Void*, column : Pointer(Void)) : Void
  fun gtk_column_view_set_enable_rubberband(this : Void*, enable_rubberband : LibC::Int) : Void
  fun gtk_column_view_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_column_view_set_reorderable(this : Void*, reorderable : LibC::Int) : Void
  fun gtk_column_view_set_show_column_separators(this : Void*, show_column_separators : LibC::Int) : Void
  fun gtk_column_view_set_show_row_separators(this : Void*, show_row_separators : LibC::Int) : Void
  fun gtk_column_view_set_single_click_activate(this : Void*, single_click_activate : LibC::Int) : Void
  fun gtk_column_view_sort_by_column(this : Void*, column : Pointer(Void), direction : UInt32) : Void
  fun gtk_combo_box_get_active(this : Void*) : Int32
  fun gtk_combo_box_get_active_id(this : Void*) : Pointer(LibC::Char)
  fun gtk_combo_box_get_active_iter(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_combo_box_get_button_sensitivity(this : Void*) : UInt32
  fun gtk_combo_box_get_child(this : Void*) : Pointer(Void)
  fun gtk_combo_box_get_entry_text_column(this : Void*) : Int32
  fun gtk_combo_box_get_has_entry(this : Void*) : LibC::Int
  fun gtk_combo_box_get_id_column(this : Void*) : Int32
  fun gtk_combo_box_get_model(this : Void*) : Pointer(Void)
  fun gtk_combo_box_get_popup_fixed_width(this : Void*) : LibC::Int
  fun gtk_combo_box_get_type : UInt64
  fun gtk_combo_box_new : Pointer(Void)
  fun gtk_combo_box_new_with_entry : Pointer(Void)
  fun gtk_combo_box_new_with_model(model : Pointer(Void)) : Pointer(Void)
  fun gtk_combo_box_new_with_model_and_entry(model : Pointer(Void)) : Pointer(Void)
  fun gtk_combo_box_popdown(this : Void*) : Void
  fun gtk_combo_box_popup(this : Void*) : Void
  fun gtk_combo_box_popup_for_device(this : Void*, device : Pointer(Void)) : Void
  fun gtk_combo_box_set_active(this : Void*, index_ : Int32) : Void
  fun gtk_combo_box_set_active_id(this : Void*, active_id : Pointer(LibC::Char)) : LibC::Int
  fun gtk_combo_box_set_active_iter(this : Void*, iter : Pointer(Void)) : Void
  fun gtk_combo_box_set_button_sensitivity(this : Void*, sensitivity : UInt32) : Void
  fun gtk_combo_box_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_combo_box_set_entry_text_column(this : Void*, text_column : Int32) : Void
  fun gtk_combo_box_set_id_column(this : Void*, id_column : Int32) : Void
  fun gtk_combo_box_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_combo_box_set_popup_fixed_width(this : Void*, fixed : LibC::Int) : Void
  fun gtk_combo_box_set_row_separator_func(this : Void*, func : TreeViewRowSeparatorFunc, data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_combo_box_text_append(this : Void*, id : Pointer(LibC::Char), text : Pointer(LibC::Char)) : Void
  fun gtk_combo_box_text_append_text(this : Void*, text : Pointer(LibC::Char)) : Void
  fun gtk_combo_box_text_get_active_text(this : Void*) : Pointer(LibC::Char)
  fun gtk_combo_box_text_get_type : UInt64
  fun gtk_combo_box_text_insert(this : Void*, position : Int32, id : Pointer(LibC::Char), text : Pointer(LibC::Char)) : Void
  fun gtk_combo_box_text_insert_text(this : Void*, position : Int32, text : Pointer(LibC::Char)) : Void
  fun gtk_combo_box_text_new : Pointer(Void)
  fun gtk_combo_box_text_new_with_entry : Pointer(Void)
  fun gtk_combo_box_text_prepend(this : Void*, id : Pointer(LibC::Char), text : Pointer(LibC::Char)) : Void
  fun gtk_combo_box_text_prepend_text(this : Void*, text : Pointer(LibC::Char)) : Void
  fun gtk_combo_box_text_remove(this : Void*, position : Int32) : Void
  fun gtk_combo_box_text_remove_all(this : Void*) : Void
  fun gtk_constant_expression_get_type : UInt64
  fun gtk_constant_expression_get_value(this : Void*) : Pointer(Void)
  fun gtk_constant_expression_new_for_value(value : Pointer(Void)) : Pointer(Void)
  fun gtk_constraint_get_constant(this : Void*) : Float64
  fun gtk_constraint_get_multiplier(this : Void*) : Float64
  fun gtk_constraint_get_relation(this : Void*) : Int32
  fun gtk_constraint_get_source(this : Void*) : Pointer(Void)
  fun gtk_constraint_get_source_attribute(this : Void*) : UInt32
  fun gtk_constraint_get_strength(this : Void*) : Int32
  fun gtk_constraint_get_target(this : Void*) : Pointer(Void)
  fun gtk_constraint_get_target_attribute(this : Void*) : UInt32
  fun gtk_constraint_get_type : UInt64
  fun gtk_constraint_guide_get_max_size(this : Void*, width : Pointer(Int32), height : Pointer(Int32)) : Void
  fun gtk_constraint_guide_get_min_size(this : Void*, width : Pointer(Int32), height : Pointer(Int32)) : Void
  fun gtk_constraint_guide_get_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_constraint_guide_get_nat_size(this : Void*, width : Pointer(Int32), height : Pointer(Int32)) : Void
  fun gtk_constraint_guide_get_strength(this : Void*) : UInt32
  fun gtk_constraint_guide_get_type : UInt64
  fun gtk_constraint_guide_new : Pointer(Void)
  fun gtk_constraint_guide_set_max_size(this : Void*, width : Int32, height : Int32) : Void
  fun gtk_constraint_guide_set_min_size(this : Void*, width : Int32, height : Int32) : Void
  fun gtk_constraint_guide_set_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun gtk_constraint_guide_set_nat_size(this : Void*, width : Int32, height : Int32) : Void
  fun gtk_constraint_guide_set_strength(this : Void*, strength : UInt32) : Void
  fun gtk_constraint_is_attached(this : Void*) : LibC::Int
  fun gtk_constraint_is_constant(this : Void*) : LibC::Int
  fun gtk_constraint_is_required(this : Void*) : LibC::Int
  fun gtk_constraint_layout_add_constraint(this : Void*, constraint : Pointer(Void)) : Void
  fun gtk_constraint_layout_add_constraints_from_descriptionv(this : Void*, lines : Pointer(Pointer(LibC::Char)), n_lines : UInt64, hspacing : Int32, vspacing : Int32, views : Pointer(Void), error : LibGLib::Error**) : Pointer(LibGLib::List)
  fun gtk_constraint_layout_add_guide(this : Void*, guide : Pointer(Void)) : Void
  fun gtk_constraint_layout_child_get_type : UInt64
  fun gtk_constraint_layout_get_type : UInt64
  fun gtk_constraint_layout_new : Pointer(Void)
  fun gtk_constraint_layout_observe_constraints(this : Void*) : Pointer(Void)
  fun gtk_constraint_layout_observe_guides(this : Void*) : Pointer(Void)
  fun gtk_constraint_layout_remove_all_constraints(this : Void*) : Void
  fun gtk_constraint_layout_remove_constraint(this : Void*, constraint : Pointer(Void)) : Void
  fun gtk_constraint_layout_remove_guide(this : Void*, guide : Pointer(Void)) : Void
  fun gtk_constraint_new(target : Pointer(Void), target_attribute : UInt32, relation : Int32, source : Pointer(Void), source_attribute : UInt32, multiplier : Float64, constant : Float64, strength : Int32) : Pointer(Void)
  fun gtk_constraint_new_constant(target : Pointer(Void), target_attribute : UInt32, relation : Int32, constant : Float64, strength : Int32) : Pointer(Void)
  fun gtk_constraint_target_get_type : UInt64
  fun gtk_constraint_vfl_parser_error_quark : UInt32
  fun gtk_css_parser_error_quark : UInt32
  fun gtk_css_parser_warning_quark : UInt32
  fun gtk_css_provider_get_type : UInt64
  fun gtk_css_provider_load_from_data(this : Void*, data : Pointer(UInt8), length : Int64) : Void
  fun gtk_css_provider_load_from_file(this : Void*, file : Pointer(Void)) : Void
  fun gtk_css_provider_load_from_path(this : Void*, path : Pointer(LibC::Char)) : Void
  fun gtk_css_provider_load_from_resource(this : Void*, resource_path : Pointer(LibC::Char)) : Void
  fun gtk_css_provider_load_named(this : Void*, name : Pointer(LibC::Char), variant : Pointer(LibC::Char)) : Void
  fun gtk_css_provider_new : Pointer(Void)
  fun gtk_css_provider_to_string(this : Void*) : Pointer(LibC::Char)
  fun gtk_css_section_get_end_location(this : Void*) : Pointer(Void)
  fun gtk_css_section_get_file(this : Void*) : Pointer(Void)
  fun gtk_css_section_get_parent(this : Void*) : Pointer(Void)
  fun gtk_css_section_get_start_location(this : Void*) : Pointer(Void)
  fun gtk_css_section_get_type : UInt64
  fun gtk_css_section_new(file : Pointer(Void), start : Pointer(Void), _end : Pointer(Void)) : Pointer(Void)
  fun gtk_css_section_print(this : Void*, string : Pointer(Void)) : Void
  fun gtk_css_section_ref(this : Void*) : Pointer(Void)
  fun gtk_css_section_to_string(this : Void*) : Pointer(LibC::Char)
  fun gtk_css_section_unref(this : Void*) : Void
  fun gtk_custom_filter_get_type : UInt64
  fun gtk_custom_filter_new(match_func : CustomFilterFunc, user_data : Pointer(Void), user_destroy : LibGLib::DestroyNotify) : Pointer(Void)
  fun gtk_custom_filter_set_filter_func(this : Void*, match_func : CustomFilterFunc, user_data : Pointer(Void), user_destroy : LibGLib::DestroyNotify) : Void
  fun gtk_custom_layout_get_type : UInt64
  fun gtk_custom_layout_new(request_mode : CustomRequestModeFunc, measure : CustomMeasureFunc, allocate : CustomAllocateFunc) : Pointer(Void)
  fun gtk_custom_sorter_get_type : UInt64
  fun gtk_custom_sorter_new(sort_func : LibGLib::CompareDataFunc, user_data : Pointer(Void), user_destroy : LibGLib::DestroyNotify) : Pointer(Void)
  fun gtk_custom_sorter_set_sort_func(this : Void*, sort_func : LibGLib::CompareDataFunc, user_data : Pointer(Void), user_destroy : LibGLib::DestroyNotify) : Void
  fun gtk_dialog_add_action_widget(this : Void*, child : Pointer(Void), response_id : Int32) : Void
  fun gtk_dialog_add_button(this : Void*, button_text : Pointer(LibC::Char), response_id : Int32) : Pointer(Void)
  fun gtk_dialog_get_content_area(this : Void*) : Pointer(Void)
  fun gtk_dialog_get_header_bar(this : Void*) : Pointer(Void)
  fun gtk_dialog_get_response_for_widget(this : Void*, widget : Pointer(Void)) : Int32
  fun gtk_dialog_get_type : UInt64
  fun gtk_dialog_get_widget_for_response(this : Void*, response_id : Int32) : Pointer(Void)
  fun gtk_dialog_new : Pointer(Void)
  fun gtk_dialog_response(this : Void*, response_id : Int32) : Void
  fun gtk_dialog_set_default_response(this : Void*, response_id : Int32) : Void
  fun gtk_dialog_set_response_sensitive(this : Void*, response_id : Int32, setting : LibC::Int) : Void
  fun gtk_directory_list_get_attributes(this : Void*) : Pointer(LibC::Char)
  fun gtk_directory_list_get_error(this : Void*) : Pointer(Void)
  fun gtk_directory_list_get_file(this : Void*) : Pointer(Void)
  fun gtk_directory_list_get_io_priority(this : Void*) : Int32
  fun gtk_directory_list_get_monitored(this : Void*) : LibC::Int
  fun gtk_directory_list_get_type : UInt64
  fun gtk_directory_list_is_loading(this : Void*) : LibC::Int
  fun gtk_directory_list_new(attributes : Pointer(LibC::Char), file : Pointer(Void)) : Pointer(Void)
  fun gtk_directory_list_set_attributes(this : Void*, attributes : Pointer(LibC::Char)) : Void
  fun gtk_directory_list_set_file(this : Void*, file : Pointer(Void)) : Void
  fun gtk_directory_list_set_io_priority(this : Void*, io_priority : Int32) : Void
  fun gtk_directory_list_set_monitored(this : Void*, monitored : LibC::Int) : Void
  fun gtk_disable_setlocale : Void
  fun gtk_distribute_natural_allocation(extra_space : Int32, n_requested_sizes : UInt32, sizes : Pointer(Void)) : Int32
  fun gtk_drag_check_threshold(this : Void*, start_x : Int32, start_y : Int32, current_x : Int32, current_y : Int32) : LibC::Int
  fun gtk_drag_icon_create_widget_for_value(value : Pointer(Void)) : Pointer(Void)
  fun gtk_drag_icon_get_child(this : Void*) : Pointer(Void)
  fun gtk_drag_icon_get_for_drag(drag : Pointer(Void)) : Pointer(Void)
  fun gtk_drag_icon_get_type : UInt64
  fun gtk_drag_icon_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_drag_icon_set_from_paintable(drag : Pointer(Void), paintable : Pointer(Void), hot_x : Int32, hot_y : Int32) : Void
  fun gtk_drag_source_drag_cancel(this : Void*) : Void
  fun gtk_drag_source_get_actions(this : Void*) : UInt32
  fun gtk_drag_source_get_content(this : Void*) : Pointer(Void)
  fun gtk_drag_source_get_drag(this : Void*) : Pointer(Void)
  fun gtk_drag_source_get_type : UInt64
  fun gtk_drag_source_new : Pointer(Void)
  fun gtk_drag_source_set_actions(this : Void*, actions : UInt32) : Void
  fun gtk_drag_source_set_content(this : Void*, content : Pointer(Void)) : Void
  fun gtk_drag_source_set_icon(this : Void*, paintable : Pointer(Void), hot_x : Int32, hot_y : Int32) : Void
  fun gtk_drawing_area_get_content_height(this : Void*) : Int32
  fun gtk_drawing_area_get_content_width(this : Void*) : Int32
  fun gtk_drawing_area_get_type : UInt64
  fun gtk_drawing_area_new : Pointer(Void)
  fun gtk_drawing_area_set_content_height(this : Void*, height : Int32) : Void
  fun gtk_drawing_area_set_content_width(this : Void*, width : Int32) : Void
  fun gtk_drawing_area_set_draw_func(this : Void*, draw_func : DrawingAreaDrawFunc, user_data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_drop_controller_motion_contains_pointer(this : Void*) : LibC::Int
  fun gtk_drop_controller_motion_get_drop(this : Void*) : Pointer(Void)
  fun gtk_drop_controller_motion_get_type : UInt64
  fun gtk_drop_controller_motion_is_pointer(this : Void*) : LibC::Int
  fun gtk_drop_controller_motion_new : Pointer(Void)
  fun gtk_drop_down_get_enable_search(this : Void*) : LibC::Int
  fun gtk_drop_down_get_expression(this : Void*) : Pointer(Void)
  fun gtk_drop_down_get_factory(this : Void*) : Pointer(Void)
  fun gtk_drop_down_get_list_factory(this : Void*) : Pointer(Void)
  fun gtk_drop_down_get_model(this : Void*) : Pointer(Void)
  fun gtk_drop_down_get_selected(this : Void*) : UInt32
  fun gtk_drop_down_get_selected_item(this : Void*) : Pointer(Void)
  fun gtk_drop_down_get_type : UInt64
  fun gtk_drop_down_new(model : Pointer(Void), expression : Pointer(Void)) : Pointer(Void)
  fun gtk_drop_down_new_from_strings(strings : Pointer(Pointer(LibC::Char))) : Pointer(Void)
  fun gtk_drop_down_set_enable_search(this : Void*, enable_search : LibC::Int) : Void
  fun gtk_drop_down_set_expression(this : Void*, expression : Pointer(Void)) : Void
  fun gtk_drop_down_set_factory(this : Void*, factory : Pointer(Void)) : Void
  fun gtk_drop_down_set_list_factory(this : Void*, factory : Pointer(Void)) : Void
  fun gtk_drop_down_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_drop_down_set_selected(this : Void*, position : UInt32) : Void
  fun gtk_drop_target_async_get_actions(this : Void*) : UInt32
  fun gtk_drop_target_async_get_formats(this : Void*) : Pointer(Void)
  fun gtk_drop_target_async_get_type : UInt64
  fun gtk_drop_target_async_new(formats : Pointer(Void), actions : UInt32) : Pointer(Void)
  fun gtk_drop_target_async_reject_drop(this : Void*, drop : Pointer(Void)) : Void
  fun gtk_drop_target_async_set_actions(this : Void*, actions : UInt32) : Void
  fun gtk_drop_target_async_set_formats(this : Void*, formats : Pointer(Void)) : Void
  fun gtk_drop_target_get_actions(this : Void*) : UInt32
  fun gtk_drop_target_get_current_drop(this : Void*) : Pointer(Void)
  fun gtk_drop_target_get_drop(this : Void*) : Pointer(Void)
  fun gtk_drop_target_get_formats(this : Void*) : Pointer(Void)
  fun gtk_drop_target_get_gtypes(this : Void*, n_types : Pointer(UInt64)) : Pointer(UInt64)
  fun gtk_drop_target_get_preload(this : Void*) : LibC::Int
  fun gtk_drop_target_get_type : UInt64
  fun gtk_drop_target_get_value(this : Void*) : Pointer(Void)
  fun gtk_drop_target_new(type : UInt64, actions : UInt32) : Pointer(Void)
  fun gtk_drop_target_reject(this : Void*) : Void
  fun gtk_drop_target_set_actions(this : Void*, actions : UInt32) : Void
  fun gtk_drop_target_set_gtypes(this : Void*, types : Pointer(UInt64), n_types : UInt64) : Void
  fun gtk_drop_target_set_preload(this : Void*, preload : LibC::Int) : Void
  fun gtk_editable_delegate_get_property(object : Pointer(Void), prop_id : UInt32, value : Pointer(Void), pspec : Pointer(Void)) : LibC::Int
  fun gtk_editable_delegate_get_property(object : Pointer(Void), prop_id : UInt32, value : Pointer(Void), pspec : Pointer(Void)) : LibC::Int
  fun gtk_editable_delegate_set_property(object : Pointer(Void), prop_id : UInt32, value : Pointer(Void), pspec : Pointer(Void)) : LibC::Int
  fun gtk_editable_delegate_set_property(object : Pointer(Void), prop_id : UInt32, value : Pointer(Void), pspec : Pointer(Void)) : LibC::Int
  fun gtk_editable_delete_selection(this : Void*) : Void
  fun gtk_editable_delete_text(this : Void*, start_pos : Int32, end_pos : Int32) : Void
  fun gtk_editable_finish_delegate(this : Void*) : Void
  fun gtk_editable_get_alignment(this : Void*) : Float32
  fun gtk_editable_get_chars(this : Void*, start_pos : Int32, end_pos : Int32) : Pointer(LibC::Char)
  fun gtk_editable_get_delegate(this : Void*) : Pointer(Void)
  fun gtk_editable_get_editable(this : Void*) : LibC::Int
  fun gtk_editable_get_enable_undo(this : Void*) : LibC::Int
  fun gtk_editable_get_max_width_chars(this : Void*) : Int32
  fun gtk_editable_get_position(this : Void*) : Int32
  fun gtk_editable_get_selection_bounds(this : Void*, start_pos : Pointer(Int32), end_pos : Pointer(Int32)) : LibC::Int
  fun gtk_editable_get_text(this : Void*) : Pointer(LibC::Char)
  fun gtk_editable_get_type : UInt64
  fun gtk_editable_get_width_chars(this : Void*) : Int32
  fun gtk_editable_init_delegate(this : Void*) : Void
  fun gtk_editable_insert_text(this : Void*, text : Pointer(LibC::Char), length : Int32, position : Pointer(Int32)) : Void
  fun gtk_editable_install_properties(object_class : Pointer(Void), first_prop : UInt32) : UInt32
  fun gtk_editable_install_properties(object_class : Pointer(Void), first_prop : UInt32) : UInt32
  fun gtk_editable_label_get_editing(this : Void*) : LibC::Int
  fun gtk_editable_label_get_type : UInt64
  fun gtk_editable_label_new(str : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_editable_label_start_editing(this : Void*) : Void
  fun gtk_editable_label_stop_editing(this : Void*, commit : LibC::Int) : Void
  fun gtk_editable_select_region(this : Void*, start_pos : Int32, end_pos : Int32) : Void
  fun gtk_editable_set_alignment(this : Void*, xalign : Float32) : Void
  fun gtk_editable_set_editable(this : Void*, is_editable : LibC::Int) : Void
  fun gtk_editable_set_enable_undo(this : Void*, enable_undo : LibC::Int) : Void
  fun gtk_editable_set_max_width_chars(this : Void*, n_chars : Int32) : Void
  fun gtk_editable_set_position(this : Void*, position : Int32) : Void
  fun gtk_editable_set_text(this : Void*, text : Pointer(LibC::Char)) : Void
  fun gtk_editable_set_width_chars(this : Void*, n_chars : Int32) : Void
  fun gtk_emoji_chooser_get_type : UInt64
  fun gtk_emoji_chooser_new : Pointer(Void)
  fun gtk_entry_buffer_delete_text(this : Void*, position : UInt32, n_chars : Int32) : UInt32
  fun gtk_entry_buffer_emit_deleted_text(this : Void*, position : UInt32, n_chars : UInt32) : Void
  fun gtk_entry_buffer_emit_inserted_text(this : Void*, position : UInt32, chars : Pointer(LibC::Char), n_chars : UInt32) : Void
  fun gtk_entry_buffer_get_bytes(this : Void*) : UInt64
  fun gtk_entry_buffer_get_length(this : Void*) : UInt32
  fun gtk_entry_buffer_get_max_length(this : Void*) : Int32
  fun gtk_entry_buffer_get_text(this : Void*) : Pointer(LibC::Char)
  fun gtk_entry_buffer_get_type : UInt64
  fun gtk_entry_buffer_insert_text(this : Void*, position : UInt32, chars : Pointer(LibC::Char), n_chars : Int32) : UInt32
  fun gtk_entry_buffer_new(initial_chars : Pointer(LibC::Char), n_initial_chars : Int32) : Pointer(Void)
  fun gtk_entry_buffer_set_max_length(this : Void*, max_length : Int32) : Void
  fun gtk_entry_buffer_set_text(this : Void*, chars : Pointer(LibC::Char), n_chars : Int32) : Void
  fun gtk_entry_completion_complete(this : Void*) : Void
  fun gtk_entry_completion_compute_prefix(this : Void*, key : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun gtk_entry_completion_get_completion_prefix(this : Void*) : Pointer(LibC::Char)
  fun gtk_entry_completion_get_entry(this : Void*) : Pointer(Void)
  fun gtk_entry_completion_get_inline_completion(this : Void*) : LibC::Int
  fun gtk_entry_completion_get_inline_selection(this : Void*) : LibC::Int
  fun gtk_entry_completion_get_minimum_key_length(this : Void*) : Int32
  fun gtk_entry_completion_get_model(this : Void*) : Pointer(Void)
  fun gtk_entry_completion_get_popup_completion(this : Void*) : LibC::Int
  fun gtk_entry_completion_get_popup_set_width(this : Void*) : LibC::Int
  fun gtk_entry_completion_get_popup_single_match(this : Void*) : LibC::Int
  fun gtk_entry_completion_get_text_column(this : Void*) : Int32
  fun gtk_entry_completion_get_type : UInt64
  fun gtk_entry_completion_insert_prefix(this : Void*) : Void
  fun gtk_entry_completion_new : Pointer(Void)
  fun gtk_entry_completion_new_with_area(area : Pointer(Void)) : Pointer(Void)
  fun gtk_entry_completion_set_inline_completion(this : Void*, inline_completion : LibC::Int) : Void
  fun gtk_entry_completion_set_inline_selection(this : Void*, inline_selection : LibC::Int) : Void
  fun gtk_entry_completion_set_match_func(this : Void*, func : EntryCompletionMatchFunc, func_data : Pointer(Void), func_notify : LibGLib::DestroyNotify) : Void
  fun gtk_entry_completion_set_minimum_key_length(this : Void*, length : Int32) : Void
  fun gtk_entry_completion_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_entry_completion_set_popup_completion(this : Void*, popup_completion : LibC::Int) : Void
  fun gtk_entry_completion_set_popup_set_width(this : Void*, popup_set_width : LibC::Int) : Void
  fun gtk_entry_completion_set_popup_single_match(this : Void*, popup_single_match : LibC::Int) : Void
  fun gtk_entry_completion_set_text_column(this : Void*, column : Int32) : Void
  fun gtk_entry_get_activates_default(this : Void*) : LibC::Int
  fun gtk_entry_get_alignment(this : Void*) : Float32
  fun gtk_entry_get_attributes(this : Void*) : Pointer(Void)
  fun gtk_entry_get_buffer(this : Void*) : Pointer(Void)
  fun gtk_entry_get_completion(this : Void*) : Pointer(Void)
  fun gtk_entry_get_current_icon_drag_source(this : Void*) : Int32
  fun gtk_entry_get_extra_menu(this : Void*) : Pointer(Void)
  fun gtk_entry_get_has_frame(this : Void*) : LibC::Int
  fun gtk_entry_get_icon_activatable(this : Void*, icon_pos : UInt32) : LibC::Int
  fun gtk_entry_get_icon_area(this : Void*, icon_pos : UInt32, icon_area : Pointer(Void)) : Void
  fun gtk_entry_get_icon_at_pos(this : Void*, x : Int32, y : Int32) : Int32
  fun gtk_entry_get_icon_gicon(this : Void*, icon_pos : UInt32) : Pointer(Void)
  fun gtk_entry_get_icon_name(this : Void*, icon_pos : UInt32) : Pointer(LibC::Char)
  fun gtk_entry_get_icon_paintable(this : Void*, icon_pos : UInt32) : Pointer(Void)
  fun gtk_entry_get_icon_sensitive(this : Void*, icon_pos : UInt32) : LibC::Int
  fun gtk_entry_get_icon_storage_type(this : Void*, icon_pos : UInt32) : UInt32
  fun gtk_entry_get_icon_tooltip_markup(this : Void*, icon_pos : UInt32) : Pointer(LibC::Char)
  fun gtk_entry_get_icon_tooltip_text(this : Void*, icon_pos : UInt32) : Pointer(LibC::Char)
  fun gtk_entry_get_input_hints(this : Void*) : UInt32
  fun gtk_entry_get_input_purpose(this : Void*) : UInt32
  fun gtk_entry_get_invisible_char(this : Void*) : UInt32
  fun gtk_entry_get_max_length(this : Void*) : Int32
  fun gtk_entry_get_overwrite_mode(this : Void*) : LibC::Int
  fun gtk_entry_get_placeholder_text(this : Void*) : Pointer(LibC::Char)
  fun gtk_entry_get_progress_fraction(this : Void*) : Float64
  fun gtk_entry_get_progress_pulse_step(this : Void*) : Float64
  fun gtk_entry_get_tabs(this : Void*) : Pointer(Void)
  fun gtk_entry_get_text_length(this : Void*) : UInt16
  fun gtk_entry_get_type : UInt64
  fun gtk_entry_get_visibility(this : Void*) : LibC::Int
  fun gtk_entry_grab_focus_without_selecting(this : Void*) : LibC::Int
  fun gtk_entry_new : Pointer(Void)
  fun gtk_entry_new_with_buffer(buffer : Pointer(Void)) : Pointer(Void)
  fun gtk_entry_progress_pulse(this : Void*) : Void
  fun gtk_entry_reset_im_context(this : Void*) : Void
  fun gtk_entry_set_activates_default(this : Void*, setting : LibC::Int) : Void
  fun gtk_entry_set_alignment(this : Void*, xalign : Float32) : Void
  fun gtk_entry_set_attributes(this : Void*, attrs : Pointer(Void)) : Void
  fun gtk_entry_set_buffer(this : Void*, buffer : Pointer(Void)) : Void
  fun gtk_entry_set_completion(this : Void*, completion : Pointer(Void)) : Void
  fun gtk_entry_set_extra_menu(this : Void*, model : Pointer(Void)) : Void
  fun gtk_entry_set_has_frame(this : Void*, setting : LibC::Int) : Void
  fun gtk_entry_set_icon_activatable(this : Void*, icon_pos : UInt32, activatable : LibC::Int) : Void
  fun gtk_entry_set_icon_drag_source(this : Void*, icon_pos : UInt32, provider : Pointer(Void), actions : UInt32) : Void
  fun gtk_entry_set_icon_from_gicon(this : Void*, icon_pos : UInt32, icon : Pointer(Void)) : Void
  fun gtk_entry_set_icon_from_icon_name(this : Void*, icon_pos : UInt32, icon_name : Pointer(LibC::Char)) : Void
  fun gtk_entry_set_icon_from_paintable(this : Void*, icon_pos : UInt32, paintable : Pointer(Void)) : Void
  fun gtk_entry_set_icon_sensitive(this : Void*, icon_pos : UInt32, sensitive : LibC::Int) : Void
  fun gtk_entry_set_icon_tooltip_markup(this : Void*, icon_pos : UInt32, tooltip : Pointer(LibC::Char)) : Void
  fun gtk_entry_set_icon_tooltip_text(this : Void*, icon_pos : UInt32, tooltip : Pointer(LibC::Char)) : Void
  fun gtk_entry_set_input_hints(this : Void*, hints : UInt32) : Void
  fun gtk_entry_set_input_purpose(this : Void*, purpose : UInt32) : Void
  fun gtk_entry_set_invisible_char(this : Void*, ch : UInt32) : Void
  fun gtk_entry_set_max_length(this : Void*, max : Int32) : Void
  fun gtk_entry_set_overwrite_mode(this : Void*, overwrite : LibC::Int) : Void
  fun gtk_entry_set_placeholder_text(this : Void*, text : Pointer(LibC::Char)) : Void
  fun gtk_entry_set_progress_fraction(this : Void*, fraction : Float64) : Void
  fun gtk_entry_set_progress_pulse_step(this : Void*, fraction : Float64) : Void
  fun gtk_entry_set_tabs(this : Void*, tabs : Pointer(Void)) : Void
  fun gtk_entry_set_visibility(this : Void*, visible : LibC::Int) : Void
  fun gtk_entry_unset_invisible_char(this : Void*) : Void
  fun gtk_enumerate_printers(func : PrinterFunc, data : Pointer(Void), destroy : LibGLib::DestroyNotify, wait : LibC::Int) : Void
  fun gtk_event_controller_focus_contains_focus(this : Void*) : LibC::Int
  fun gtk_event_controller_focus_get_type : UInt64
  fun gtk_event_controller_focus_is_focus(this : Void*) : LibC::Int
  fun gtk_event_controller_focus_new : Pointer(Void)
  fun gtk_event_controller_get_current_event(this : Void*) : Pointer(Void)
  fun gtk_event_controller_get_current_event_device(this : Void*) : Pointer(Void)
  fun gtk_event_controller_get_current_event_state(this : Void*) : UInt32
  fun gtk_event_controller_get_current_event_time(this : Void*) : UInt32
  fun gtk_event_controller_get_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_event_controller_get_propagation_limit(this : Void*) : UInt32
  fun gtk_event_controller_get_propagation_phase(this : Void*) : UInt32
  fun gtk_event_controller_get_type : UInt64
  fun gtk_event_controller_get_widget(this : Void*) : Pointer(Void)
  fun gtk_event_controller_key_forward(this : Void*, widget : Pointer(Void)) : LibC::Int
  fun gtk_event_controller_key_get_group(this : Void*) : UInt32
  fun gtk_event_controller_key_get_im_context(this : Void*) : Pointer(Void)
  fun gtk_event_controller_key_get_type : UInt64
  fun gtk_event_controller_key_new : Pointer(Void)
  fun gtk_event_controller_key_set_im_context(this : Void*, im_context : Pointer(Void)) : Void
  fun gtk_event_controller_legacy_get_type : UInt64
  fun gtk_event_controller_legacy_new : Pointer(Void)
  fun gtk_event_controller_motion_contains_pointer(this : Void*) : LibC::Int
  fun gtk_event_controller_motion_get_type : UInt64
  fun gtk_event_controller_motion_is_pointer(this : Void*) : LibC::Int
  fun gtk_event_controller_motion_new : Pointer(Void)
  fun gtk_event_controller_reset(this : Void*) : Void
  fun gtk_event_controller_scroll_get_flags(this : Void*) : UInt32
  fun gtk_event_controller_scroll_get_type : UInt64
  fun gtk_event_controller_scroll_new(flags : UInt32) : Pointer(Void)
  fun gtk_event_controller_scroll_set_flags(this : Void*, flags : UInt32) : Void
  fun gtk_event_controller_set_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun gtk_event_controller_set_propagation_limit(this : Void*, limit : UInt32) : Void
  fun gtk_event_controller_set_propagation_phase(this : Void*, phase : UInt32) : Void
  fun gtk_every_filter_get_type : UInt64
  fun gtk_every_filter_new : Pointer(Void)
  fun gtk_expander_get_child(this : Void*) : Pointer(Void)
  fun gtk_expander_get_expanded(this : Void*) : LibC::Int
  fun gtk_expander_get_label(this : Void*) : Pointer(LibC::Char)
  fun gtk_expander_get_label_widget(this : Void*) : Pointer(Void)
  fun gtk_expander_get_resize_toplevel(this : Void*) : LibC::Int
  fun gtk_expander_get_type : UInt64
  fun gtk_expander_get_use_markup(this : Void*) : LibC::Int
  fun gtk_expander_get_use_underline(this : Void*) : LibC::Int
  fun gtk_expander_new(label : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_expander_new_with_mnemonic(label : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_expander_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_expander_set_expanded(this : Void*, expanded : LibC::Int) : Void
  fun gtk_expander_set_label(this : Void*, label : Pointer(LibC::Char)) : Void
  fun gtk_expander_set_label_widget(this : Void*, label_widget : Pointer(Void)) : Void
  fun gtk_expander_set_resize_toplevel(this : Void*, resize_toplevel : LibC::Int) : Void
  fun gtk_expander_set_use_markup(this : Void*, use_markup : LibC::Int) : Void
  fun gtk_expander_set_use_underline(this : Void*, use_underline : LibC::Int) : Void
  fun gtk_expression_bind(this : Void*, target : Pointer(Void), property : Pointer(LibC::Char), this_ : Pointer(Void)) : Pointer(Void)
  fun gtk_expression_evaluate(this : Void*, this_ : Pointer(Void), value : Pointer(Void)) : LibC::Int
  fun gtk_expression_get_type : UInt64
  fun gtk_expression_get_value_type(this : Void*) : UInt64
  fun gtk_expression_is_static(this : Void*) : LibC::Int
  fun gtk_expression_ref(this : Void*) : Pointer(Void)
  fun gtk_expression_unref(this : Void*) : Void
  fun gtk_expression_watch(this : Void*, this_ : Pointer(Void), notify : ExpressionNotify, user_data : Pointer(Void), user_destroy : LibGLib::DestroyNotify) : Pointer(Void)
  fun gtk_expression_watch_evaluate(this : Void*, value : Pointer(Void)) : LibC::Int
  fun gtk_expression_watch_get_type : UInt64
  fun gtk_expression_watch_ref(this : Void*) : Pointer(Void)
  fun gtk_expression_watch_unref(this : Void*) : Void
  fun gtk_expression_watch_unwatch(this : Void*) : Void
  fun gtk_file_chooser_add_choice(this : Void*, id : Pointer(LibC::Char), label : Pointer(LibC::Char), options : Pointer(Pointer(LibC::Char)), option_labels : Pointer(Pointer(LibC::Char))) : Void
  fun gtk_file_chooser_add_filter(this : Void*, filter : Pointer(Void)) : Void
  fun gtk_file_chooser_add_shortcut_folder(this : Void*, folder : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gtk_file_chooser_dialog_get_type : UInt64
  fun gtk_file_chooser_error_quark : UInt32
  fun gtk_file_chooser_get_action(this : Void*) : UInt32
  fun gtk_file_chooser_get_choice(this : Void*, id : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun gtk_file_chooser_get_create_folders(this : Void*) : LibC::Int
  fun gtk_file_chooser_get_current_folder(this : Void*) : Pointer(Void)
  fun gtk_file_chooser_get_current_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_file_chooser_get_file(this : Void*) : Pointer(Void)
  fun gtk_file_chooser_get_files(this : Void*) : Pointer(Void)
  fun gtk_file_chooser_get_filter(this : Void*) : Pointer(Void)
  fun gtk_file_chooser_get_filters(this : Void*) : Pointer(Void)
  fun gtk_file_chooser_get_select_multiple(this : Void*) : LibC::Int
  fun gtk_file_chooser_get_shortcut_folders(this : Void*) : Pointer(Void)
  fun gtk_file_chooser_get_type : UInt64
  fun gtk_file_chooser_native_get_accept_label(this : Void*) : Pointer(LibC::Char)
  fun gtk_file_chooser_native_get_cancel_label(this : Void*) : Pointer(LibC::Char)
  fun gtk_file_chooser_native_get_type : UInt64
  fun gtk_file_chooser_native_new(title : Pointer(LibC::Char), parent : Pointer(Void), action : UInt32, accept_label : Pointer(LibC::Char), cancel_label : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_file_chooser_native_set_accept_label(this : Void*, accept_label : Pointer(LibC::Char)) : Void
  fun gtk_file_chooser_native_set_cancel_label(this : Void*, cancel_label : Pointer(LibC::Char)) : Void
  fun gtk_file_chooser_remove_choice(this : Void*, id : Pointer(LibC::Char)) : Void
  fun gtk_file_chooser_remove_filter(this : Void*, filter : Pointer(Void)) : Void
  fun gtk_file_chooser_remove_shortcut_folder(this : Void*, folder : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gtk_file_chooser_set_action(this : Void*, action : UInt32) : Void
  fun gtk_file_chooser_set_choice(this : Void*, id : Pointer(LibC::Char), option : Pointer(LibC::Char)) : Void
  fun gtk_file_chooser_set_create_folders(this : Void*, create_folders : LibC::Int) : Void
  fun gtk_file_chooser_set_current_folder(this : Void*, file : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gtk_file_chooser_set_current_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun gtk_file_chooser_set_file(this : Void*, file : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gtk_file_chooser_set_filter(this : Void*, filter : Pointer(Void)) : Void
  fun gtk_file_chooser_set_select_multiple(this : Void*, select_multiple : LibC::Int) : Void
  fun gtk_file_chooser_widget_get_type : UInt64
  fun gtk_file_chooser_widget_new(action : UInt32) : Pointer(Void)
  fun gtk_file_filter_add_mime_type(this : Void*, mime_type : Pointer(LibC::Char)) : Void
  fun gtk_file_filter_add_pattern(this : Void*, pattern : Pointer(LibC::Char)) : Void
  fun gtk_file_filter_add_pixbuf_formats(this : Void*) : Void
  fun gtk_file_filter_add_suffix(this : Void*, suffix : Pointer(LibC::Char)) : Void
  fun gtk_file_filter_get_attributes(this : Void*) : Pointer(Pointer(LibC::Char))
  fun gtk_file_filter_get_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_file_filter_get_type : UInt64
  fun gtk_file_filter_new : Pointer(Void)
  fun gtk_file_filter_new_from_gvariant(variant : Pointer(Void)) : Pointer(Void)
  fun gtk_file_filter_set_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun gtk_file_filter_to_gvariant(this : Void*) : Pointer(Void)
  fun gtk_filter_changed(this : Void*, change : UInt32) : Void
  fun gtk_filter_get_strictness(this : Void*) : UInt32
  fun gtk_filter_get_type : UInt64
  fun gtk_filter_list_model_get_filter(this : Void*) : Pointer(Void)
  fun gtk_filter_list_model_get_incremental(this : Void*) : LibC::Int
  fun gtk_filter_list_model_get_model(this : Void*) : Pointer(Void)
  fun gtk_filter_list_model_get_pending(this : Void*) : UInt32
  fun gtk_filter_list_model_get_type : UInt64
  fun gtk_filter_list_model_new(model : Pointer(Void), filter : Pointer(Void)) : Pointer(Void)
  fun gtk_filter_list_model_set_filter(this : Void*, filter : Pointer(Void)) : Void
  fun gtk_filter_list_model_set_incremental(this : Void*, incremental : LibC::Int) : Void
  fun gtk_filter_list_model_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_filter_match(this : Void*, item : Pointer(Void)) : LibC::Int
  fun gtk_fixed_get_child_position(this : Void*, widget : Pointer(Void), x : Pointer(Float64), y : Pointer(Float64)) : Void
  fun gtk_fixed_get_child_transform(this : Void*, widget : Pointer(Void)) : Pointer(Void)
  fun gtk_fixed_get_type : UInt64
  fun gtk_fixed_layout_child_get_transform(this : Void*) : Pointer(Void)
  fun gtk_fixed_layout_child_get_type : UInt64
  fun gtk_fixed_layout_child_set_transform(this : Void*, transform : Pointer(Void)) : Void
  fun gtk_fixed_layout_get_type : UInt64
  fun gtk_fixed_layout_new : Pointer(Void)
  fun gtk_fixed_move(this : Void*, widget : Pointer(Void), x : Float64, y : Float64) : Void
  fun gtk_fixed_new : Pointer(Void)
  fun gtk_fixed_put(this : Void*, widget : Pointer(Void), x : Float64, y : Float64) : Void
  fun gtk_fixed_remove(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_fixed_set_child_transform(this : Void*, widget : Pointer(Void), transform : Pointer(Void)) : Void
  fun gtk_flatten_list_model_get_model(this : Void*) : Pointer(Void)
  fun gtk_flatten_list_model_get_model_for_item(this : Void*, position : UInt32) : Pointer(Void)
  fun gtk_flatten_list_model_get_type : UInt64
  fun gtk_flatten_list_model_new(model : Pointer(Void)) : Pointer(Void)
  fun gtk_flatten_list_model_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_flow_box_bind_model(this : Void*, model : Pointer(Void), create_widget_func : FlowBoxCreateWidgetFunc, user_data : Pointer(Void), user_data_free_func : LibGLib::DestroyNotify) : Void
  fun gtk_flow_box_child_changed(this : Void*) : Void
  fun gtk_flow_box_child_get_child(this : Void*) : Pointer(Void)
  fun gtk_flow_box_child_get_index(this : Void*) : Int32
  fun gtk_flow_box_child_get_type : UInt64
  fun gtk_flow_box_child_is_selected(this : Void*) : LibC::Int
  fun gtk_flow_box_child_new : Pointer(Void)
  fun gtk_flow_box_child_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_flow_box_get_activate_on_single_click(this : Void*) : LibC::Int
  fun gtk_flow_box_get_child_at_index(this : Void*, idx : Int32) : Pointer(Void)
  fun gtk_flow_box_get_child_at_pos(this : Void*, x : Int32, y : Int32) : Pointer(Void)
  fun gtk_flow_box_get_column_spacing(this : Void*) : UInt32
  fun gtk_flow_box_get_homogeneous(this : Void*) : LibC::Int
  fun gtk_flow_box_get_max_children_per_line(this : Void*) : UInt32
  fun gtk_flow_box_get_min_children_per_line(this : Void*) : UInt32
  fun gtk_flow_box_get_row_spacing(this : Void*) : UInt32
  fun gtk_flow_box_get_selected_children(this : Void*) : Pointer(LibGLib::List)
  fun gtk_flow_box_get_selection_mode(this : Void*) : UInt32
  fun gtk_flow_box_get_type : UInt64
  fun gtk_flow_box_insert(this : Void*, widget : Pointer(Void), position : Int32) : Void
  fun gtk_flow_box_invalidate_filter(this : Void*) : Void
  fun gtk_flow_box_invalidate_sort(this : Void*) : Void
  fun gtk_flow_box_new : Pointer(Void)
  fun gtk_flow_box_remove(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_flow_box_select_all(this : Void*) : Void
  fun gtk_flow_box_select_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_flow_box_selected_foreach(this : Void*, func : FlowBoxForeachFunc, data : Pointer(Void)) : Void
  fun gtk_flow_box_set_activate_on_single_click(this : Void*, single : LibC::Int) : Void
  fun gtk_flow_box_set_column_spacing(this : Void*, spacing : UInt32) : Void
  fun gtk_flow_box_set_filter_func(this : Void*, filter_func : FlowBoxFilterFunc, user_data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_flow_box_set_hadjustment(this : Void*, adjustment : Pointer(Void)) : Void
  fun gtk_flow_box_set_homogeneous(this : Void*, homogeneous : LibC::Int) : Void
  fun gtk_flow_box_set_max_children_per_line(this : Void*, n_children : UInt32) : Void
  fun gtk_flow_box_set_min_children_per_line(this : Void*, n_children : UInt32) : Void
  fun gtk_flow_box_set_row_spacing(this : Void*, spacing : UInt32) : Void
  fun gtk_flow_box_set_selection_mode(this : Void*, mode : UInt32) : Void
  fun gtk_flow_box_set_sort_func(this : Void*, sort_func : FlowBoxSortFunc, user_data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_flow_box_set_vadjustment(this : Void*, adjustment : Pointer(Void)) : Void
  fun gtk_flow_box_unselect_all(this : Void*) : Void
  fun gtk_flow_box_unselect_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_font_button_get_modal(this : Void*) : LibC::Int
  fun gtk_font_button_get_title(this : Void*) : Pointer(LibC::Char)
  fun gtk_font_button_get_type : UInt64
  fun gtk_font_button_get_use_font(this : Void*) : LibC::Int
  fun gtk_font_button_get_use_size(this : Void*) : LibC::Int
  fun gtk_font_button_new : Pointer(Void)
  fun gtk_font_button_new_with_font(fontname : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_font_button_set_modal(this : Void*, modal : LibC::Int) : Void
  fun gtk_font_button_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun gtk_font_button_set_use_font(this : Void*, use_font : LibC::Int) : Void
  fun gtk_font_button_set_use_size(this : Void*, use_size : LibC::Int) : Void
  fun gtk_font_chooser_dialog_get_type : UInt64
  fun gtk_font_chooser_dialog_new(title : Pointer(LibC::Char), parent : Pointer(Void)) : Pointer(Void)
  fun gtk_font_chooser_get_font(this : Void*) : Pointer(LibC::Char)
  fun gtk_font_chooser_get_font_desc(this : Void*) : Pointer(Void)
  fun gtk_font_chooser_get_font_face(this : Void*) : Pointer(Void)
  fun gtk_font_chooser_get_font_family(this : Void*) : Pointer(Void)
  fun gtk_font_chooser_get_font_features(this : Void*) : Pointer(LibC::Char)
  fun gtk_font_chooser_get_font_map(this : Void*) : Pointer(Void)
  fun gtk_font_chooser_get_font_size(this : Void*) : Int32
  fun gtk_font_chooser_get_language(this : Void*) : Pointer(LibC::Char)
  fun gtk_font_chooser_get_level(this : Void*) : UInt32
  fun gtk_font_chooser_get_preview_text(this : Void*) : Pointer(LibC::Char)
  fun gtk_font_chooser_get_show_preview_entry(this : Void*) : LibC::Int
  fun gtk_font_chooser_get_type : UInt64
  fun gtk_font_chooser_set_filter_func(this : Void*, filter : FontFilterFunc, user_data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_font_chooser_set_font(this : Void*, fontname : Pointer(LibC::Char)) : Void
  fun gtk_font_chooser_set_font_desc(this : Void*, font_desc : Pointer(Void)) : Void
  fun gtk_font_chooser_set_font_map(this : Void*, fontmap : Pointer(Void)) : Void
  fun gtk_font_chooser_set_language(this : Void*, language : Pointer(LibC::Char)) : Void
  fun gtk_font_chooser_set_level(this : Void*, level : UInt32) : Void
  fun gtk_font_chooser_set_preview_text(this : Void*, text : Pointer(LibC::Char)) : Void
  fun gtk_font_chooser_set_show_preview_entry(this : Void*, show_preview_entry : LibC::Int) : Void
  fun gtk_font_chooser_widget_get_type : UInt64
  fun gtk_font_chooser_widget_new : Pointer(Void)
  fun gtk_frame_get_child(this : Void*) : Pointer(Void)
  fun gtk_frame_get_label(this : Void*) : Pointer(LibC::Char)
  fun gtk_frame_get_label_align(this : Void*) : Float32
  fun gtk_frame_get_label_widget(this : Void*) : Pointer(Void)
  fun gtk_frame_get_type : UInt64
  fun gtk_frame_new(label : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_frame_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_frame_set_label(this : Void*, label : Pointer(LibC::Char)) : Void
  fun gtk_frame_set_label_align(this : Void*, xalign : Float32) : Void
  fun gtk_frame_set_label_widget(this : Void*, label_widget : Pointer(Void)) : Void
  fun gtk_gesture_click_get_type : UInt64
  fun gtk_gesture_click_new : Pointer(Void)
  fun gtk_gesture_drag_get_offset(this : Void*, x : Pointer(Float64), y : Pointer(Float64)) : LibC::Int
  fun gtk_gesture_drag_get_start_point(this : Void*, x : Pointer(Float64), y : Pointer(Float64)) : LibC::Int
  fun gtk_gesture_drag_get_type : UInt64
  fun gtk_gesture_drag_new : Pointer(Void)
  fun gtk_gesture_get_bounding_box(this : Void*, rect : Pointer(Void)) : LibC::Int
  fun gtk_gesture_get_bounding_box_center(this : Void*, x : Pointer(Float64), y : Pointer(Float64)) : LibC::Int
  fun gtk_gesture_get_device(this : Void*) : Pointer(Void)
  fun gtk_gesture_get_group(this : Void*) : Pointer(LibGLib::List)
  fun gtk_gesture_get_last_event(this : Void*, sequence : Pointer(Void)) : Pointer(Void)
  fun gtk_gesture_get_last_updated_sequence(this : Void*) : Pointer(Void)
  fun gtk_gesture_get_point(this : Void*, sequence : Pointer(Void), x : Pointer(Float64), y : Pointer(Float64)) : LibC::Int
  fun gtk_gesture_get_sequence_state(this : Void*, sequence : Pointer(Void)) : UInt32
  fun gtk_gesture_get_sequences(this : Void*) : Pointer(LibGLib::List)
  fun gtk_gesture_get_type : UInt64
  fun gtk_gesture_group(this : Void*, gesture : Pointer(Void)) : Void
  fun gtk_gesture_handles_sequence(this : Void*, sequence : Pointer(Void)) : LibC::Int
  fun gtk_gesture_is_active(this : Void*) : LibC::Int
  fun gtk_gesture_is_grouped_with(this : Void*, other : Pointer(Void)) : LibC::Int
  fun gtk_gesture_is_recognized(this : Void*) : LibC::Int
  fun gtk_gesture_long_press_get_delay_factor(this : Void*) : Float64
  fun gtk_gesture_long_press_get_type : UInt64
  fun gtk_gesture_long_press_new : Pointer(Void)
  fun gtk_gesture_long_press_set_delay_factor(this : Void*, delay_factor : Float64) : Void
  fun gtk_gesture_pan_get_orientation(this : Void*) : UInt32
  fun gtk_gesture_pan_get_type : UInt64
  fun gtk_gesture_pan_new(orientation : UInt32) : Pointer(Void)
  fun gtk_gesture_pan_set_orientation(this : Void*, orientation : UInt32) : Void
  fun gtk_gesture_rotate_get_angle_delta(this : Void*) : Float64
  fun gtk_gesture_rotate_get_type : UInt64
  fun gtk_gesture_rotate_new : Pointer(Void)
  fun gtk_gesture_set_sequence_state(this : Void*, sequence : Pointer(Void), state : UInt32) : LibC::Int
  fun gtk_gesture_set_state(this : Void*, state : UInt32) : LibC::Int
  fun gtk_gesture_single_get_button(this : Void*) : UInt32
  fun gtk_gesture_single_get_current_button(this : Void*) : UInt32
  fun gtk_gesture_single_get_current_sequence(this : Void*) : Pointer(Void)
  fun gtk_gesture_single_get_exclusive(this : Void*) : LibC::Int
  fun gtk_gesture_single_get_touch_only(this : Void*) : LibC::Int
  fun gtk_gesture_single_get_type : UInt64
  fun gtk_gesture_single_set_button(this : Void*, button : UInt32) : Void
  fun gtk_gesture_single_set_exclusive(this : Void*, exclusive : LibC::Int) : Void
  fun gtk_gesture_single_set_touch_only(this : Void*, touch_only : LibC::Int) : Void
  fun gtk_gesture_stylus_get_axes(this : Void*, axes : Pointer(UInt32), values : Pointer(Pointer(Float64))) : LibC::Int
  fun gtk_gesture_stylus_get_axis(this : Void*, axis : UInt32, value : Pointer(Float64)) : LibC::Int
  fun gtk_gesture_stylus_get_backlog(this : Void*, backlog : Pointer(Pointer(Void)), n_elems : Pointer(UInt32)) : LibC::Int
  fun gtk_gesture_stylus_get_device_tool(this : Void*) : Pointer(Void)
  fun gtk_gesture_stylus_get_type : UInt64
  fun gtk_gesture_stylus_new : Pointer(Void)
  fun gtk_gesture_swipe_get_type : UInt64
  fun gtk_gesture_swipe_get_velocity(this : Void*, velocity_x : Pointer(Float64), velocity_y : Pointer(Float64)) : LibC::Int
  fun gtk_gesture_swipe_new : Pointer(Void)
  fun gtk_gesture_ungroup(this : Void*) : Void
  fun gtk_gesture_zoom_get_scale_delta(this : Void*) : Float64
  fun gtk_gesture_zoom_get_type : UInt64
  fun gtk_gesture_zoom_new : Pointer(Void)
  fun gtk_get_binary_age : UInt32
  fun gtk_get_debug_flags : UInt32
  fun gtk_get_default_language : Pointer(Void)
  fun gtk_get_interface_age : UInt32
  fun gtk_get_locale_direction : UInt32
  fun gtk_get_major_version : UInt32
  fun gtk_get_micro_version : UInt32
  fun gtk_get_minor_version : UInt32
  fun gtk_gl_area_attach_buffers(this : Void*) : Void
  fun gtk_gl_area_get_auto_render(this : Void*) : LibC::Int
  fun gtk_gl_area_get_context(this : Void*) : Pointer(Void)
  fun gtk_gl_area_get_error(this : Void*) : Pointer(Void)
  fun gtk_gl_area_get_has_depth_buffer(this : Void*) : LibC::Int
  fun gtk_gl_area_get_has_stencil_buffer(this : Void*) : LibC::Int
  fun gtk_gl_area_get_required_version(this : Void*, major : Pointer(Int32), minor : Pointer(Int32)) : Void
  fun gtk_gl_area_get_type : UInt64
  fun gtk_gl_area_get_use_es(this : Void*) : LibC::Int
  fun gtk_gl_area_make_current(this : Void*) : Void
  fun gtk_gl_area_new : Pointer(Void)
  fun gtk_gl_area_queue_render(this : Void*) : Void
  fun gtk_gl_area_set_auto_render(this : Void*, auto_render : LibC::Int) : Void
  fun gtk_gl_area_set_error(this : Void*, error : Pointer(Void)) : Void
  fun gtk_gl_area_set_has_depth_buffer(this : Void*, has_depth_buffer : LibC::Int) : Void
  fun gtk_gl_area_set_has_stencil_buffer(this : Void*, has_stencil_buffer : LibC::Int) : Void
  fun gtk_gl_area_set_required_version(this : Void*, major : Int32, minor : Int32) : Void
  fun gtk_gl_area_set_use_es(this : Void*, use_es : LibC::Int) : Void
  fun gtk_grid_attach(this : Void*, child : Pointer(Void), column : Int32, row : Int32, width : Int32, height : Int32) : Void
  fun gtk_grid_attach_next_to(this : Void*, child : Pointer(Void), sibling : Pointer(Void), side : UInt32, width : Int32, height : Int32) : Void
  fun gtk_grid_get_baseline_row(this : Void*) : Int32
  fun gtk_grid_get_child_at(this : Void*, column : Int32, row : Int32) : Pointer(Void)
  fun gtk_grid_get_column_homogeneous(this : Void*) : LibC::Int
  fun gtk_grid_get_column_spacing(this : Void*) : UInt32
  fun gtk_grid_get_row_baseline_position(this : Void*, row : Int32) : UInt32
  fun gtk_grid_get_row_homogeneous(this : Void*) : LibC::Int
  fun gtk_grid_get_row_spacing(this : Void*) : UInt32
  fun gtk_grid_get_type : UInt64
  fun gtk_grid_insert_column(this : Void*, position : Int32) : Void
  fun gtk_grid_insert_next_to(this : Void*, sibling : Pointer(Void), side : UInt32) : Void
  fun gtk_grid_insert_row(this : Void*, position : Int32) : Void
  fun gtk_grid_layout_child_get_column(this : Void*) : Int32
  fun gtk_grid_layout_child_get_column_span(this : Void*) : Int32
  fun gtk_grid_layout_child_get_row(this : Void*) : Int32
  fun gtk_grid_layout_child_get_row_span(this : Void*) : Int32
  fun gtk_grid_layout_child_get_type : UInt64
  fun gtk_grid_layout_child_set_column(this : Void*, column : Int32) : Void
  fun gtk_grid_layout_child_set_column_span(this : Void*, span : Int32) : Void
  fun gtk_grid_layout_child_set_row(this : Void*, row : Int32) : Void
  fun gtk_grid_layout_child_set_row_span(this : Void*, span : Int32) : Void
  fun gtk_grid_layout_get_baseline_row(this : Void*) : Int32
  fun gtk_grid_layout_get_column_homogeneous(this : Void*) : LibC::Int
  fun gtk_grid_layout_get_column_spacing(this : Void*) : UInt32
  fun gtk_grid_layout_get_row_baseline_position(this : Void*, row : Int32) : UInt32
  fun gtk_grid_layout_get_row_homogeneous(this : Void*) : LibC::Int
  fun gtk_grid_layout_get_row_spacing(this : Void*) : UInt32
  fun gtk_grid_layout_get_type : UInt64
  fun gtk_grid_layout_new : Pointer(Void)
  fun gtk_grid_layout_set_baseline_row(this : Void*, row : Int32) : Void
  fun gtk_grid_layout_set_column_homogeneous(this : Void*, homogeneous : LibC::Int) : Void
  fun gtk_grid_layout_set_column_spacing(this : Void*, spacing : UInt32) : Void
  fun gtk_grid_layout_set_row_baseline_position(this : Void*, row : Int32, pos : UInt32) : Void
  fun gtk_grid_layout_set_row_homogeneous(this : Void*, homogeneous : LibC::Int) : Void
  fun gtk_grid_layout_set_row_spacing(this : Void*, spacing : UInt32) : Void
  fun gtk_grid_new : Pointer(Void)
  fun gtk_grid_query_child(this : Void*, child : Pointer(Void), column : Pointer(Int32), row : Pointer(Int32), width : Pointer(Int32), height : Pointer(Int32)) : Void
  fun gtk_grid_remove(this : Void*, child : Pointer(Void)) : Void
  fun gtk_grid_remove_column(this : Void*, position : Int32) : Void
  fun gtk_grid_remove_row(this : Void*, position : Int32) : Void
  fun gtk_grid_set_baseline_row(this : Void*, row : Int32) : Void
  fun gtk_grid_set_column_homogeneous(this : Void*, homogeneous : LibC::Int) : Void
  fun gtk_grid_set_column_spacing(this : Void*, spacing : UInt32) : Void
  fun gtk_grid_set_row_baseline_position(this : Void*, row : Int32, pos : UInt32) : Void
  fun gtk_grid_set_row_homogeneous(this : Void*, homogeneous : LibC::Int) : Void
  fun gtk_grid_set_row_spacing(this : Void*, spacing : UInt32) : Void
  fun gtk_grid_view_get_enable_rubberband(this : Void*) : LibC::Int
  fun gtk_grid_view_get_factory(this : Void*) : Pointer(Void)
  fun gtk_grid_view_get_max_columns(this : Void*) : UInt32
  fun gtk_grid_view_get_min_columns(this : Void*) : UInt32
  fun gtk_grid_view_get_model(this : Void*) : Pointer(Void)
  fun gtk_grid_view_get_single_click_activate(this : Void*) : LibC::Int
  fun gtk_grid_view_get_type : UInt64
  fun gtk_grid_view_new(model : Pointer(Void), factory : Pointer(Void)) : Pointer(Void)
  fun gtk_grid_view_set_enable_rubberband(this : Void*, enable_rubberband : LibC::Int) : Void
  fun gtk_grid_view_set_factory(this : Void*, factory : Pointer(Void)) : Void
  fun gtk_grid_view_set_max_columns(this : Void*, max_columns : UInt32) : Void
  fun gtk_grid_view_set_min_columns(this : Void*, min_columns : UInt32) : Void
  fun gtk_grid_view_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_grid_view_set_single_click_activate(this : Void*, single_click_activate : LibC::Int) : Void
  fun gtk_header_bar_get_decoration_layout(this : Void*) : Pointer(LibC::Char)
  fun gtk_header_bar_get_show_title_buttons(this : Void*) : LibC::Int
  fun gtk_header_bar_get_title_widget(this : Void*) : Pointer(Void)
  fun gtk_header_bar_get_type : UInt64
  fun gtk_header_bar_new : Pointer(Void)
  fun gtk_header_bar_pack_end(this : Void*, child : Pointer(Void)) : Void
  fun gtk_header_bar_pack_start(this : Void*, child : Pointer(Void)) : Void
  fun gtk_header_bar_remove(this : Void*, child : Pointer(Void)) : Void
  fun gtk_header_bar_set_decoration_layout(this : Void*, layout : Pointer(LibC::Char)) : Void
  fun gtk_header_bar_set_show_title_buttons(this : Void*, setting : LibC::Int) : Void
  fun gtk_header_bar_set_title_widget(this : Void*, title_widget : Pointer(Void)) : Void
  fun gtk_hsv_to_rgb(h : Float32, s : Float32, v : Float32, r : Pointer(Float32), g : Pointer(Float32), b : Pointer(Float32)) : Void
  fun gtk_icon_paintable_get_file(this : Void*) : Pointer(Void)
  fun gtk_icon_paintable_get_icon_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_icon_paintable_get_type : UInt64
  fun gtk_icon_paintable_is_symbolic(this : Void*) : LibC::Int
  fun gtk_icon_paintable_new_for_file(file : Pointer(Void), size : Int32, scale : Int32) : Pointer(Void)
  fun gtk_icon_theme_add_resource_path(this : Void*, path : Pointer(LibC::Char)) : Void
  fun gtk_icon_theme_add_search_path(this : Void*, path : Pointer(LibC::Char)) : Void
  fun gtk_icon_theme_error_quark : UInt32
  fun gtk_icon_theme_get_display(this : Void*) : Pointer(Void)
  fun gtk_icon_theme_get_for_display(display : Pointer(Void)) : Pointer(Void)
  fun gtk_icon_theme_get_icon_names(this : Void*) : Pointer(Pointer(LibC::Char))
  fun gtk_icon_theme_get_icon_sizes(this : Void*, icon_name : Pointer(LibC::Char)) : Pointer(Int32)
  fun gtk_icon_theme_get_resource_path(this : Void*) : Pointer(Pointer(LibC::Char))
  fun gtk_icon_theme_get_search_path(this : Void*) : Pointer(Pointer(LibC::Char))
  fun gtk_icon_theme_get_theme_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_icon_theme_get_type : UInt64
  fun gtk_icon_theme_has_gicon(this : Void*, gicon : Pointer(Void)) : LibC::Int
  fun gtk_icon_theme_has_icon(this : Void*, icon_name : Pointer(LibC::Char)) : LibC::Int
  fun gtk_icon_theme_lookup_by_gicon(this : Void*, icon : Pointer(Void), size : Int32, scale : Int32, direction : UInt32, flags : UInt32) : Pointer(Void)
  fun gtk_icon_theme_lookup_icon(this : Void*, icon_name : Pointer(LibC::Char), fallbacks : Pointer(Pointer(LibC::Char)), size : Int32, scale : Int32, direction : UInt32, flags : UInt32) : Pointer(Void)
  fun gtk_icon_theme_new : Pointer(Void)
  fun gtk_icon_theme_set_resource_path(this : Void*, path : Pointer(Pointer(LibC::Char))) : Void
  fun gtk_icon_theme_set_search_path(this : Void*, path : Pointer(Pointer(LibC::Char))) : Void
  fun gtk_icon_theme_set_theme_name(this : Void*, theme_name : Pointer(LibC::Char)) : Void
  fun gtk_icon_view_create_drag_icon(this : Void*, path : Pointer(Void)) : Pointer(Void)
  fun gtk_icon_view_enable_model_drag_dest(this : Void*, formats : Pointer(Void), actions : UInt32) : Void
  fun gtk_icon_view_enable_model_drag_source(this : Void*, start_button_mask : UInt32, formats : Pointer(Void), actions : UInt32) : Void
  fun gtk_icon_view_get_activate_on_single_click(this : Void*) : LibC::Int
  fun gtk_icon_view_get_cell_rect(this : Void*, path : Pointer(Void), cell : Pointer(Void), rect : Pointer(Void)) : LibC::Int
  fun gtk_icon_view_get_column_spacing(this : Void*) : Int32
  fun gtk_icon_view_get_columns(this : Void*) : Int32
  fun gtk_icon_view_get_cursor(this : Void*, path : Pointer(Pointer(Void)), cell : Pointer(Pointer(Void))) : LibC::Int
  fun gtk_icon_view_get_dest_item_at_pos(this : Void*, drag_x : Int32, drag_y : Int32, path : Pointer(Pointer(Void)), pos : Pointer(UInt32)) : LibC::Int
  fun gtk_icon_view_get_drag_dest_item(this : Void*, path : Pointer(Pointer(Void)), pos : Pointer(UInt32)) : Void
  fun gtk_icon_view_get_item_at_pos(this : Void*, x : Int32, y : Int32, path : Pointer(Pointer(Void)), cell : Pointer(Pointer(Void))) : LibC::Int
  fun gtk_icon_view_get_item_column(this : Void*, path : Pointer(Void)) : Int32
  fun gtk_icon_view_get_item_orientation(this : Void*) : UInt32
  fun gtk_icon_view_get_item_padding(this : Void*) : Int32
  fun gtk_icon_view_get_item_row(this : Void*, path : Pointer(Void)) : Int32
  fun gtk_icon_view_get_item_width(this : Void*) : Int32
  fun gtk_icon_view_get_margin(this : Void*) : Int32
  fun gtk_icon_view_get_markup_column(this : Void*) : Int32
  fun gtk_icon_view_get_model(this : Void*) : Pointer(Void)
  fun gtk_icon_view_get_path_at_pos(this : Void*, x : Int32, y : Int32) : Pointer(Void)
  fun gtk_icon_view_get_pixbuf_column(this : Void*) : Int32
  fun gtk_icon_view_get_reorderable(this : Void*) : LibC::Int
  fun gtk_icon_view_get_row_spacing(this : Void*) : Int32
  fun gtk_icon_view_get_selected_items(this : Void*) : Pointer(LibGLib::List)
  fun gtk_icon_view_get_selection_mode(this : Void*) : UInt32
  fun gtk_icon_view_get_spacing(this : Void*) : Int32
  fun gtk_icon_view_get_text_column(this : Void*) : Int32
  fun gtk_icon_view_get_tooltip_column(this : Void*) : Int32
  fun gtk_icon_view_get_tooltip_context(this : Void*, x : Int32, y : Int32, keyboard_tip : LibC::Int, model : Pointer(Pointer(Void)), path : Pointer(Pointer(Void)), iter : Pointer(Void)) : LibC::Int
  fun gtk_icon_view_get_type : UInt64
  fun gtk_icon_view_get_visible_range(this : Void*, start_path : Pointer(Pointer(Void)), end_path : Pointer(Pointer(Void))) : LibC::Int
  fun gtk_icon_view_item_activated(this : Void*, path : Pointer(Void)) : Void
  fun gtk_icon_view_new : Pointer(Void)
  fun gtk_icon_view_new_with_area(area : Pointer(Void)) : Pointer(Void)
  fun gtk_icon_view_new_with_model(model : Pointer(Void)) : Pointer(Void)
  fun gtk_icon_view_path_is_selected(this : Void*, path : Pointer(Void)) : LibC::Int
  fun gtk_icon_view_scroll_to_path(this : Void*, path : Pointer(Void), use_align : LibC::Int, row_align : Float32, col_align : Float32) : Void
  fun gtk_icon_view_select_all(this : Void*) : Void
  fun gtk_icon_view_select_path(this : Void*, path : Pointer(Void)) : Void
  fun gtk_icon_view_selected_foreach(this : Void*, func : IconViewForeachFunc, data : Pointer(Void)) : Void
  fun gtk_icon_view_set_activate_on_single_click(this : Void*, single : LibC::Int) : Void
  fun gtk_icon_view_set_column_spacing(this : Void*, column_spacing : Int32) : Void
  fun gtk_icon_view_set_columns(this : Void*, columns : Int32) : Void
  fun gtk_icon_view_set_cursor(this : Void*, path : Pointer(Void), cell : Pointer(Void), start_editing : LibC::Int) : Void
  fun gtk_icon_view_set_drag_dest_item(this : Void*, path : Pointer(Void), pos : UInt32) : Void
  fun gtk_icon_view_set_item_orientation(this : Void*, orientation : UInt32) : Void
  fun gtk_icon_view_set_item_padding(this : Void*, item_padding : Int32) : Void
  fun gtk_icon_view_set_item_width(this : Void*, item_width : Int32) : Void
  fun gtk_icon_view_set_margin(this : Void*, margin : Int32) : Void
  fun gtk_icon_view_set_markup_column(this : Void*, column : Int32) : Void
  fun gtk_icon_view_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_icon_view_set_pixbuf_column(this : Void*, column : Int32) : Void
  fun gtk_icon_view_set_reorderable(this : Void*, reorderable : LibC::Int) : Void
  fun gtk_icon_view_set_row_spacing(this : Void*, row_spacing : Int32) : Void
  fun gtk_icon_view_set_selection_mode(this : Void*, mode : UInt32) : Void
  fun gtk_icon_view_set_spacing(this : Void*, spacing : Int32) : Void
  fun gtk_icon_view_set_text_column(this : Void*, column : Int32) : Void
  fun gtk_icon_view_set_tooltip_cell(this : Void*, tooltip : Pointer(Void), path : Pointer(Void), cell : Pointer(Void)) : Void
  fun gtk_icon_view_set_tooltip_column(this : Void*, column : Int32) : Void
  fun gtk_icon_view_set_tooltip_item(this : Void*, tooltip : Pointer(Void), path : Pointer(Void)) : Void
  fun gtk_icon_view_unselect_all(this : Void*) : Void
  fun gtk_icon_view_unselect_path(this : Void*, path : Pointer(Void)) : Void
  fun gtk_icon_view_unset_model_drag_dest(this : Void*) : Void
  fun gtk_icon_view_unset_model_drag_source(this : Void*) : Void
  fun gtk_im_context_delete_surrounding(this : Void*, offset : Int32, n_chars : Int32) : LibC::Int
  fun gtk_im_context_filter_key(this : Void*, press : LibC::Int, surface : Pointer(Void), device : Pointer(Void), time : UInt32, keycode : UInt32, state : UInt32, group : Int32) : LibC::Int
  fun gtk_im_context_filter_keypress(this : Void*, event : Pointer(Void)) : LibC::Int
  fun gtk_im_context_focus_in(this : Void*) : Void
  fun gtk_im_context_focus_out(this : Void*) : Void
  fun gtk_im_context_get_preedit_string(this : Void*, str : Pointer(Pointer(LibC::Char)), attrs : Pointer(Pointer(Void)), cursor_pos : Pointer(Int32)) : Void
  fun gtk_im_context_get_surrounding(this : Void*, text : Pointer(Pointer(LibC::Char)), cursor_index : Pointer(Int32)) : LibC::Int
  fun gtk_im_context_get_surrounding_with_selection(this : Void*, text : Pointer(Pointer(LibC::Char)), cursor_index : Pointer(Int32), anchor_index : Pointer(Int32)) : LibC::Int
  fun gtk_im_context_get_type : UInt64
  fun gtk_im_context_reset(this : Void*) : Void
  fun gtk_im_context_set_client_widget(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_im_context_set_cursor_location(this : Void*, area : Pointer(Void)) : Void
  fun gtk_im_context_set_surrounding(this : Void*, text : Pointer(LibC::Char), len : Int32, cursor_index : Int32) : Void
  fun gtk_im_context_set_surrounding_with_selection(this : Void*, text : Pointer(LibC::Char), len : Int32, cursor_index : Int32, anchor_index : Int32) : Void
  fun gtk_im_context_set_use_preedit(this : Void*, use_preedit : LibC::Int) : Void
  fun gtk_im_context_simple_add_compose_file(this : Void*, compose_file : Pointer(LibC::Char)) : Void
  fun gtk_im_context_simple_get_type : UInt64
  fun gtk_im_context_simple_new : Pointer(Void)
  fun gtk_im_multicontext_get_context_id(this : Void*) : Pointer(LibC::Char)
  fun gtk_im_multicontext_get_type : UInt64
  fun gtk_im_multicontext_new : Pointer(Void)
  fun gtk_im_multicontext_set_context_id(this : Void*, context_id : Pointer(LibC::Char)) : Void
  fun gtk_image_clear(this : Void*) : Void
  fun gtk_image_get_gicon(this : Void*) : Pointer(Void)
  fun gtk_image_get_icon_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_image_get_icon_size(this : Void*) : UInt32
  fun gtk_image_get_paintable(this : Void*) : Pointer(Void)
  fun gtk_image_get_pixel_size(this : Void*) : Int32
  fun gtk_image_get_storage_type(this : Void*) : UInt32
  fun gtk_image_get_type : UInt64
  fun gtk_image_new : Pointer(Void)
  fun gtk_image_new_from_file(filename : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_image_new_from_gicon(icon : Pointer(Void)) : Pointer(Void)
  fun gtk_image_new_from_icon_name(icon_name : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_image_new_from_paintable(paintable : Pointer(Void)) : Pointer(Void)
  fun gtk_image_new_from_pixbuf(pixbuf : Pointer(Void)) : Pointer(Void)
  fun gtk_image_new_from_resource(resource_path : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_image_set_from_file(this : Void*, filename : Pointer(LibC::Char)) : Void
  fun gtk_image_set_from_gicon(this : Void*, icon : Pointer(Void)) : Void
  fun gtk_image_set_from_icon_name(this : Void*, icon_name : Pointer(LibC::Char)) : Void
  fun gtk_image_set_from_paintable(this : Void*, paintable : Pointer(Void)) : Void
  fun gtk_image_set_from_pixbuf(this : Void*, pixbuf : Pointer(Void)) : Void
  fun gtk_image_set_from_resource(this : Void*, resource_path : Pointer(LibC::Char)) : Void
  fun gtk_image_set_icon_size(this : Void*, icon_size : UInt32) : Void
  fun gtk_image_set_pixel_size(this : Void*, pixel_size : Int32) : Void
  fun gtk_info_bar_add_action_widget(this : Void*, child : Pointer(Void), response_id : Int32) : Void
  fun gtk_info_bar_add_button(this : Void*, button_text : Pointer(LibC::Char), response_id : Int32) : Pointer(Void)
  fun gtk_info_bar_add_child(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_info_bar_get_message_type(this : Void*) : UInt32
  fun gtk_info_bar_get_revealed(this : Void*) : LibC::Int
  fun gtk_info_bar_get_show_close_button(this : Void*) : LibC::Int
  fun gtk_info_bar_get_type : UInt64
  fun gtk_info_bar_new : Pointer(Void)
  fun gtk_info_bar_remove_action_widget(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_info_bar_remove_child(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_info_bar_response(this : Void*, response_id : Int32) : Void
  fun gtk_info_bar_set_default_response(this : Void*, response_id : Int32) : Void
  fun gtk_info_bar_set_message_type(this : Void*, message_type : UInt32) : Void
  fun gtk_info_bar_set_response_sensitive(this : Void*, response_id : Int32, setting : LibC::Int) : Void
  fun gtk_info_bar_set_revealed(this : Void*, revealed : LibC::Int) : Void
  fun gtk_info_bar_set_show_close_button(this : Void*, setting : LibC::Int) : Void
  fun gtk_init : Void
  fun gtk_init_check : LibC::Int
  fun gtk_is_initialized : LibC::Int
  fun gtk_keyval_trigger_get_keyval(this : Void*) : UInt32
  fun gtk_keyval_trigger_get_modifiers(this : Void*) : UInt32
  fun gtk_keyval_trigger_get_type : UInt64
  fun gtk_keyval_trigger_new(keyval : UInt32, modifiers : UInt32) : Pointer(Void)
  fun gtk_label_get_attributes(this : Void*) : Pointer(Void)
  fun gtk_label_get_current_uri(this : Void*) : Pointer(LibC::Char)
  fun gtk_label_get_ellipsize(this : Void*) : UInt32
  fun gtk_label_get_extra_menu(this : Void*) : Pointer(Void)
  fun gtk_label_get_justify(this : Void*) : UInt32
  fun gtk_label_get_label(this : Void*) : Pointer(LibC::Char)
  fun gtk_label_get_layout(this : Void*) : Pointer(Void)
  fun gtk_label_get_layout_offsets(this : Void*, x : Pointer(Int32), y : Pointer(Int32)) : Void
  fun gtk_label_get_lines(this : Void*) : Int32
  fun gtk_label_get_max_width_chars(this : Void*) : Int32
  fun gtk_label_get_mnemonic_keyval(this : Void*) : UInt32
  fun gtk_label_get_mnemonic_widget(this : Void*) : Pointer(Void)
  fun gtk_label_get_selectable(this : Void*) : LibC::Int
  fun gtk_label_get_selection_bounds(this : Void*, start : Pointer(Int32), _end : Pointer(Int32)) : LibC::Int
  fun gtk_label_get_single_line_mode(this : Void*) : LibC::Int
  fun gtk_label_get_text(this : Void*) : Pointer(LibC::Char)
  fun gtk_label_get_type : UInt64
  fun gtk_label_get_use_markup(this : Void*) : LibC::Int
  fun gtk_label_get_use_underline(this : Void*) : LibC::Int
  fun gtk_label_get_width_chars(this : Void*) : Int32
  fun gtk_label_get_wrap(this : Void*) : LibC::Int
  fun gtk_label_get_wrap_mode(this : Void*) : UInt32
  fun gtk_label_get_xalign(this : Void*) : Float32
  fun gtk_label_get_yalign(this : Void*) : Float32
  fun gtk_label_new(str : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_label_new_with_mnemonic(str : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_label_select_region(this : Void*, start_offset : Int32, end_offset : Int32) : Void
  fun gtk_label_set_attributes(this : Void*, attrs : Pointer(Void)) : Void
  fun gtk_label_set_ellipsize(this : Void*, mode : UInt32) : Void
  fun gtk_label_set_extra_menu(this : Void*, model : Pointer(Void)) : Void
  fun gtk_label_set_justify(this : Void*, jtype : UInt32) : Void
  fun gtk_label_set_label(this : Void*, str : Pointer(LibC::Char)) : Void
  fun gtk_label_set_lines(this : Void*, lines : Int32) : Void
  fun gtk_label_set_markup(this : Void*, str : Pointer(LibC::Char)) : Void
  fun gtk_label_set_markup_with_mnemonic(this : Void*, str : Pointer(LibC::Char)) : Void
  fun gtk_label_set_max_width_chars(this : Void*, n_chars : Int32) : Void
  fun gtk_label_set_mnemonic_widget(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_label_set_selectable(this : Void*, setting : LibC::Int) : Void
  fun gtk_label_set_single_line_mode(this : Void*, single_line_mode : LibC::Int) : Void
  fun gtk_label_set_text(this : Void*, str : Pointer(LibC::Char)) : Void
  fun gtk_label_set_text_with_mnemonic(this : Void*, str : Pointer(LibC::Char)) : Void
  fun gtk_label_set_use_markup(this : Void*, setting : LibC::Int) : Void
  fun gtk_label_set_use_underline(this : Void*, setting : LibC::Int) : Void
  fun gtk_label_set_width_chars(this : Void*, n_chars : Int32) : Void
  fun gtk_label_set_wrap(this : Void*, wrap : LibC::Int) : Void
  fun gtk_label_set_wrap_mode(this : Void*, wrap_mode : UInt32) : Void
  fun gtk_label_set_xalign(this : Void*, xalign : Float32) : Void
  fun gtk_label_set_yalign(this : Void*, yalign : Float32) : Void
  fun gtk_layout_child_get_child_widget(this : Void*) : Pointer(Void)
  fun gtk_layout_child_get_layout_manager(this : Void*) : Pointer(Void)
  fun gtk_layout_child_get_type : UInt64
  fun gtk_layout_manager_allocate(this : Void*, widget : Pointer(Void), width : Int32, height : Int32, baseline : Int32) : Void
  fun gtk_layout_manager_get_layout_child(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun gtk_layout_manager_get_request_mode(this : Void*) : UInt32
  fun gtk_layout_manager_get_type : UInt64
  fun gtk_layout_manager_get_widget(this : Void*) : Pointer(Void)
  fun gtk_layout_manager_layout_changed(this : Void*) : Void
  fun gtk_layout_manager_measure(this : Void*, widget : Pointer(Void), orientation : UInt32, for_size : Int32, minimum : Pointer(Int32), natural : Pointer(Int32), minimum_baseline : Pointer(Int32), natural_baseline : Pointer(Int32)) : Void
  fun gtk_level_bar_add_offset_value(this : Void*, name : Pointer(LibC::Char), value : Float64) : Void
  fun gtk_level_bar_get_inverted(this : Void*) : LibC::Int
  fun gtk_level_bar_get_max_value(this : Void*) : Float64
  fun gtk_level_bar_get_min_value(this : Void*) : Float64
  fun gtk_level_bar_get_mode(this : Void*) : UInt32
  fun gtk_level_bar_get_offset_value(this : Void*, name : Pointer(LibC::Char), value : Pointer(Float64)) : LibC::Int
  fun gtk_level_bar_get_type : UInt64
  fun gtk_level_bar_get_value(this : Void*) : Float64
  fun gtk_level_bar_new : Pointer(Void)
  fun gtk_level_bar_new_for_interval(min_value : Float64, max_value : Float64) : Pointer(Void)
  fun gtk_level_bar_remove_offset_value(this : Void*, name : Pointer(LibC::Char)) : Void
  fun gtk_level_bar_set_inverted(this : Void*, inverted : LibC::Int) : Void
  fun gtk_level_bar_set_max_value(this : Void*, value : Float64) : Void
  fun gtk_level_bar_set_min_value(this : Void*, value : Float64) : Void
  fun gtk_level_bar_set_mode(this : Void*, mode : UInt32) : Void
  fun gtk_level_bar_set_value(this : Void*, value : Float64) : Void
  fun gtk_link_button_get_type : UInt64
  fun gtk_link_button_get_uri(this : Void*) : Pointer(LibC::Char)
  fun gtk_link_button_get_visited(this : Void*) : LibC::Int
  fun gtk_link_button_new(uri : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_link_button_new_with_label(uri : Pointer(LibC::Char), label : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_link_button_set_uri(this : Void*, uri : Pointer(LibC::Char)) : Void
  fun gtk_link_button_set_visited(this : Void*, visited : LibC::Int) : Void
  fun gtk_list_base_get_type : UInt64
  fun gtk_list_box_append(this : Void*, child : Pointer(Void)) : Void
  fun gtk_list_box_bind_model(this : Void*, model : Pointer(Void), create_widget_func : ListBoxCreateWidgetFunc, user_data : Pointer(Void), user_data_free_func : LibGLib::DestroyNotify) : Void
  fun gtk_list_box_drag_highlight_row(this : Void*, row : Pointer(Void)) : Void
  fun gtk_list_box_drag_unhighlight_row(this : Void*) : Void
  fun gtk_list_box_get_activate_on_single_click(this : Void*) : LibC::Int
  fun gtk_list_box_get_adjustment(this : Void*) : Pointer(Void)
  fun gtk_list_box_get_row_at_index(this : Void*, index_ : Int32) : Pointer(Void)
  fun gtk_list_box_get_row_at_y(this : Void*, y : Int32) : Pointer(Void)
  fun gtk_list_box_get_selected_row(this : Void*) : Pointer(Void)
  fun gtk_list_box_get_selected_rows(this : Void*) : Pointer(LibGLib::List)
  fun gtk_list_box_get_selection_mode(this : Void*) : UInt32
  fun gtk_list_box_get_show_separators(this : Void*) : LibC::Int
  fun gtk_list_box_get_type : UInt64
  fun gtk_list_box_insert(this : Void*, child : Pointer(Void), position : Int32) : Void
  fun gtk_list_box_invalidate_filter(this : Void*) : Void
  fun gtk_list_box_invalidate_headers(this : Void*) : Void
  fun gtk_list_box_invalidate_sort(this : Void*) : Void
  fun gtk_list_box_new : Pointer(Void)
  fun gtk_list_box_prepend(this : Void*, child : Pointer(Void)) : Void
  fun gtk_list_box_remove(this : Void*, child : Pointer(Void)) : Void
  fun gtk_list_box_row_changed(this : Void*) : Void
  fun gtk_list_box_row_get_activatable(this : Void*) : LibC::Int
  fun gtk_list_box_row_get_child(this : Void*) : Pointer(Void)
  fun gtk_list_box_row_get_header(this : Void*) : Pointer(Void)
  fun gtk_list_box_row_get_index(this : Void*) : Int32
  fun gtk_list_box_row_get_selectable(this : Void*) : LibC::Int
  fun gtk_list_box_row_get_type : UInt64
  fun gtk_list_box_row_is_selected(this : Void*) : LibC::Int
  fun gtk_list_box_row_new : Pointer(Void)
  fun gtk_list_box_row_set_activatable(this : Void*, activatable : LibC::Int) : Void
  fun gtk_list_box_row_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_list_box_row_set_header(this : Void*, header : Pointer(Void)) : Void
  fun gtk_list_box_row_set_selectable(this : Void*, selectable : LibC::Int) : Void
  fun gtk_list_box_select_all(this : Void*) : Void
  fun gtk_list_box_select_row(this : Void*, row : Pointer(Void)) : Void
  fun gtk_list_box_selected_foreach(this : Void*, func : ListBoxForeachFunc, data : Pointer(Void)) : Void
  fun gtk_list_box_set_activate_on_single_click(this : Void*, single : LibC::Int) : Void
  fun gtk_list_box_set_adjustment(this : Void*, adjustment : Pointer(Void)) : Void
  fun gtk_list_box_set_filter_func(this : Void*, filter_func : ListBoxFilterFunc, user_data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_list_box_set_header_func(this : Void*, update_header : ListBoxUpdateHeaderFunc, user_data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_list_box_set_placeholder(this : Void*, placeholder : Pointer(Void)) : Void
  fun gtk_list_box_set_selection_mode(this : Void*, mode : UInt32) : Void
  fun gtk_list_box_set_show_separators(this : Void*, show_separators : LibC::Int) : Void
  fun gtk_list_box_set_sort_func(this : Void*, sort_func : ListBoxSortFunc, user_data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_list_box_unselect_all(this : Void*) : Void
  fun gtk_list_box_unselect_row(this : Void*, row : Pointer(Void)) : Void
  fun gtk_list_item_factory_get_type : UInt64
  fun gtk_list_item_get_activatable(this : Void*) : LibC::Int
  fun gtk_list_item_get_child(this : Void*) : Pointer(Void)
  fun gtk_list_item_get_item(this : Void*) : Pointer(Void)
  fun gtk_list_item_get_position(this : Void*) : UInt32
  fun gtk_list_item_get_selectable(this : Void*) : LibC::Int
  fun gtk_list_item_get_selected(this : Void*) : LibC::Int
  fun gtk_list_item_get_type : UInt64
  fun gtk_list_item_set_activatable(this : Void*, activatable : LibC::Int) : Void
  fun gtk_list_item_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_list_item_set_selectable(this : Void*, selectable : LibC::Int) : Void
  fun gtk_list_store_append(this : Void*, iter : Pointer(Void)) : Void
  fun gtk_list_store_clear(this : Void*) : Void
  fun gtk_list_store_get_type : UInt64
  fun gtk_list_store_insert(this : Void*, iter : Pointer(Void), position : Int32) : Void
  fun gtk_list_store_insert_after(this : Void*, iter : Pointer(Void), sibling : Pointer(Void)) : Void
  fun gtk_list_store_insert_before(this : Void*, iter : Pointer(Void), sibling : Pointer(Void)) : Void
  fun gtk_list_store_insert_with_valuesv(this : Void*, iter : Pointer(Void), position : Int32, columns : Pointer(Int32), values : Pointer(Void), n_values : Int32) : Void
  fun gtk_list_store_iter_is_valid(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_list_store_move_after(this : Void*, iter : Pointer(Void), position : Pointer(Void)) : Void
  fun gtk_list_store_move_before(this : Void*, iter : Pointer(Void), position : Pointer(Void)) : Void
  fun gtk_list_store_newv(n_columns : Int32, types : Pointer(UInt64)) : Pointer(Void)
  fun gtk_list_store_prepend(this : Void*, iter : Pointer(Void)) : Void
  fun gtk_list_store_remove(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_list_store_reorder(this : Void*, new_order : Pointer(Int32)) : Void
  fun gtk_list_store_set_column_types(this : Void*, n_columns : Int32, types : Pointer(UInt64)) : Void
  fun gtk_list_store_set_value(this : Void*, iter : Pointer(Void), column : Int32, value : Pointer(Void)) : Void
  fun gtk_list_store_set_valuesv(this : Void*, iter : Pointer(Void), columns : Pointer(Int32), values : Pointer(Void), n_values : Int32) : Void
  fun gtk_list_store_swap(this : Void*, a : Pointer(Void), b : Pointer(Void)) : Void
  fun gtk_list_view_get_enable_rubberband(this : Void*) : LibC::Int
  fun gtk_list_view_get_factory(this : Void*) : Pointer(Void)
  fun gtk_list_view_get_model(this : Void*) : Pointer(Void)
  fun gtk_list_view_get_show_separators(this : Void*) : LibC::Int
  fun gtk_list_view_get_single_click_activate(this : Void*) : LibC::Int
  fun gtk_list_view_get_type : UInt64
  fun gtk_list_view_new(model : Pointer(Void), factory : Pointer(Void)) : Pointer(Void)
  fun gtk_list_view_set_enable_rubberband(this : Void*, enable_rubberband : LibC::Int) : Void
  fun gtk_list_view_set_factory(this : Void*, factory : Pointer(Void)) : Void
  fun gtk_list_view_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_list_view_set_show_separators(this : Void*, show_separators : LibC::Int) : Void
  fun gtk_list_view_set_single_click_activate(this : Void*, single_click_activate : LibC::Int) : Void
  fun gtk_lock_button_get_permission(this : Void*) : Pointer(Void)
  fun gtk_lock_button_get_type : UInt64
  fun gtk_lock_button_new(permission : Pointer(Void)) : Pointer(Void)
  fun gtk_lock_button_set_permission(this : Void*, permission : Pointer(Void)) : Void
  fun gtk_map_list_model_get_model(this : Void*) : Pointer(Void)
  fun gtk_map_list_model_get_type : UInt64
  fun gtk_map_list_model_has_map(this : Void*) : LibC::Int
  fun gtk_map_list_model_new(model : Pointer(Void), map_func : MapListModelMapFunc, user_data : Pointer(Void), user_destroy : LibGLib::DestroyNotify) : Pointer(Void)
  fun gtk_map_list_model_set_map_func(this : Void*, map_func : MapListModelMapFunc, user_data : Pointer(Void), user_destroy : LibGLib::DestroyNotify) : Void
  fun gtk_map_list_model_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_media_controls_get_media_stream(this : Void*) : Pointer(Void)
  fun gtk_media_controls_get_type : UInt64
  fun gtk_media_controls_new(stream : Pointer(Void)) : Pointer(Void)
  fun gtk_media_controls_set_media_stream(this : Void*, stream : Pointer(Void)) : Void
  fun gtk_media_file_clear(this : Void*) : Void
  fun gtk_media_file_get_file(this : Void*) : Pointer(Void)
  fun gtk_media_file_get_input_stream(this : Void*) : Pointer(Void)
  fun gtk_media_file_get_type : UInt64
  fun gtk_media_file_new : Pointer(Void)
  fun gtk_media_file_new_for_file(file : Pointer(Void)) : Pointer(Void)
  fun gtk_media_file_new_for_filename(filename : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_media_file_new_for_input_stream(stream : Pointer(Void)) : Pointer(Void)
  fun gtk_media_file_new_for_resource(resource_path : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_media_file_set_file(this : Void*, file : Pointer(Void)) : Void
  fun gtk_media_file_set_filename(this : Void*, filename : Pointer(LibC::Char)) : Void
  fun gtk_media_file_set_input_stream(this : Void*, stream : Pointer(Void)) : Void
  fun gtk_media_file_set_resource(this : Void*, resource_path : Pointer(LibC::Char)) : Void
  fun gtk_media_stream_gerror(this : Void*, error : Pointer(Void)) : Void
  fun gtk_media_stream_get_duration(this : Void*) : Int64
  fun gtk_media_stream_get_ended(this : Void*) : LibC::Int
  fun gtk_media_stream_get_error(this : Void*) : Pointer(Void)
  fun gtk_media_stream_get_loop(this : Void*) : LibC::Int
  fun gtk_media_stream_get_muted(this : Void*) : LibC::Int
  fun gtk_media_stream_get_playing(this : Void*) : LibC::Int
  fun gtk_media_stream_get_timestamp(this : Void*) : Int64
  fun gtk_media_stream_get_type : UInt64
  fun gtk_media_stream_get_volume(this : Void*) : Float64
  fun gtk_media_stream_has_audio(this : Void*) : LibC::Int
  fun gtk_media_stream_has_video(this : Void*) : LibC::Int
  fun gtk_media_stream_is_prepared(this : Void*) : LibC::Int
  fun gtk_media_stream_is_seekable(this : Void*) : LibC::Int
  fun gtk_media_stream_is_seeking(this : Void*) : LibC::Int
  fun gtk_media_stream_pause(this : Void*) : Void
  fun gtk_media_stream_play(this : Void*) : Void
  fun gtk_media_stream_realize(this : Void*, surface : Pointer(Void)) : Void
  fun gtk_media_stream_seek(this : Void*, timestamp : Int64) : Void
  fun gtk_media_stream_seek_failed(this : Void*) : Void
  fun gtk_media_stream_seek_success(this : Void*) : Void
  fun gtk_media_stream_set_loop(this : Void*, loop : LibC::Int) : Void
  fun gtk_media_stream_set_muted(this : Void*, muted : LibC::Int) : Void
  fun gtk_media_stream_set_playing(this : Void*, playing : LibC::Int) : Void
  fun gtk_media_stream_set_volume(this : Void*, volume : Float64) : Void
  fun gtk_media_stream_stream_ended(this : Void*) : Void
  fun gtk_media_stream_stream_prepared(this : Void*, has_audio : LibC::Int, has_video : LibC::Int, seekable : LibC::Int, duration : Int64) : Void
  fun gtk_media_stream_stream_unprepared(this : Void*) : Void
  fun gtk_media_stream_unrealize(this : Void*, surface : Pointer(Void)) : Void
  fun gtk_media_stream_update(this : Void*, timestamp : Int64) : Void
  fun gtk_menu_button_get_always_show_arrow(this : Void*) : LibC::Int
  fun gtk_menu_button_get_direction(this : Void*) : UInt32
  fun gtk_menu_button_get_has_frame(this : Void*) : LibC::Int
  fun gtk_menu_button_get_icon_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_menu_button_get_label(this : Void*) : Pointer(LibC::Char)
  fun gtk_menu_button_get_menu_model(this : Void*) : Pointer(Void)
  fun gtk_menu_button_get_popover(this : Void*) : Pointer(Void)
  fun gtk_menu_button_get_primary(this : Void*) : LibC::Int
  fun gtk_menu_button_get_type : UInt64
  fun gtk_menu_button_get_use_underline(this : Void*) : LibC::Int
  fun gtk_menu_button_new : Pointer(Void)
  fun gtk_menu_button_popdown(this : Void*) : Void
  fun gtk_menu_button_popup(this : Void*) : Void
  fun gtk_menu_button_set_always_show_arrow(this : Void*, always_show_arrow : LibC::Int) : Void
  fun gtk_menu_button_set_create_popup_func(this : Void*, func : MenuButtonCreatePopupFunc, user_data : Pointer(Void), destroy_notify : LibGLib::DestroyNotify) : Void
  fun gtk_menu_button_set_direction(this : Void*, direction : UInt32) : Void
  fun gtk_menu_button_set_has_frame(this : Void*, has_frame : LibC::Int) : Void
  fun gtk_menu_button_set_icon_name(this : Void*, icon_name : Pointer(LibC::Char)) : Void
  fun gtk_menu_button_set_label(this : Void*, label : Pointer(LibC::Char)) : Void
  fun gtk_menu_button_set_menu_model(this : Void*, menu_model : Pointer(Void)) : Void
  fun gtk_menu_button_set_popover(this : Void*, popover : Pointer(Void)) : Void
  fun gtk_menu_button_set_primary(this : Void*, primary : LibC::Int) : Void
  fun gtk_menu_button_set_use_underline(this : Void*, use_underline : LibC::Int) : Void
  fun gtk_message_dialog_get_message_area(this : Void*) : Pointer(Void)
  fun gtk_message_dialog_get_type : UInt64
  fun gtk_message_dialog_set_markup(this : Void*, str : Pointer(LibC::Char)) : Void
  fun gtk_mnemonic_action_get : Pointer(Void)
  fun gtk_mnemonic_action_get_type : UInt64
  fun gtk_mnemonic_trigger_get_keyval(this : Void*) : UInt32
  fun gtk_mnemonic_trigger_get_type : UInt64
  fun gtk_mnemonic_trigger_new(keyval : UInt32) : Pointer(Void)
  fun gtk_mount_operation_get_display(this : Void*) : Pointer(Void)
  fun gtk_mount_operation_get_parent(this : Void*) : Pointer(Void)
  fun gtk_mount_operation_get_type : UInt64
  fun gtk_mount_operation_is_showing(this : Void*) : LibC::Int
  fun gtk_mount_operation_new(parent : Pointer(Void)) : Pointer(Void)
  fun gtk_mount_operation_set_display(this : Void*, display : Pointer(Void)) : Void
  fun gtk_mount_operation_set_parent(this : Void*, parent : Pointer(Void)) : Void
  fun gtk_multi_filter_append(this : Void*, filter : Pointer(Void)) : Void
  fun gtk_multi_filter_get_type : UInt64
  fun gtk_multi_filter_remove(this : Void*, position : UInt32) : Void
  fun gtk_multi_selection_get_model(this : Void*) : Pointer(Void)
  fun gtk_multi_selection_get_type : UInt64
  fun gtk_multi_selection_new(model : Pointer(Void)) : Pointer(Void)
  fun gtk_multi_selection_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_multi_sorter_append(this : Void*, sorter : Pointer(Void)) : Void
  fun gtk_multi_sorter_get_type : UInt64
  fun gtk_multi_sorter_new : Pointer(Void)
  fun gtk_multi_sorter_remove(this : Void*, position : UInt32) : Void
  fun gtk_named_action_get_action_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_named_action_get_type : UInt64
  fun gtk_named_action_new(name : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_native_dialog_destroy(this : Void*) : Void
  fun gtk_native_dialog_get_modal(this : Void*) : LibC::Int
  fun gtk_native_dialog_get_title(this : Void*) : Pointer(LibC::Char)
  fun gtk_native_dialog_get_transient_for(this : Void*) : Pointer(Void)
  fun gtk_native_dialog_get_type : UInt64
  fun gtk_native_dialog_get_visible(this : Void*) : LibC::Int
  fun gtk_native_dialog_hide(this : Void*) : Void
  fun gtk_native_dialog_set_modal(this : Void*, modal : LibC::Int) : Void
  fun gtk_native_dialog_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun gtk_native_dialog_set_transient_for(this : Void*, parent : Pointer(Void)) : Void
  fun gtk_native_dialog_show(this : Void*) : Void
  fun gtk_native_get_for_surface(surface : Pointer(Void)) : Pointer(Void)
  fun gtk_native_get_for_surface(surface : Pointer(Void)) : Pointer(Void)
  fun gtk_native_get_renderer(this : Void*) : Pointer(Void)
  fun gtk_native_get_surface(this : Void*) : Pointer(Void)
  fun gtk_native_get_surface_transform(this : Void*, x : Pointer(Float64), y : Pointer(Float64)) : Void
  fun gtk_native_get_type : UInt64
  fun gtk_native_realize(this : Void*) : Void
  fun gtk_native_unrealize(this : Void*) : Void
  fun gtk_never_trigger_get : Pointer(Void)
  fun gtk_never_trigger_get_type : UInt64
  fun gtk_no_selection_get_model(this : Void*) : Pointer(Void)
  fun gtk_no_selection_get_type : UInt64
  fun gtk_no_selection_new(model : Pointer(Void)) : Pointer(Void)
  fun gtk_no_selection_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_notebook_append_page(this : Void*, child : Pointer(Void), tab_label : Pointer(Void)) : Int32
  fun gtk_notebook_append_page_menu(this : Void*, child : Pointer(Void), tab_label : Pointer(Void), menu_label : Pointer(Void)) : Int32
  fun gtk_notebook_detach_tab(this : Void*, child : Pointer(Void)) : Void
  fun gtk_notebook_get_action_widget(this : Void*, pack_type : UInt32) : Pointer(Void)
  fun gtk_notebook_get_current_page(this : Void*) : Int32
  fun gtk_notebook_get_group_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_notebook_get_menu_label(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun gtk_notebook_get_menu_label_text(this : Void*, child : Pointer(Void)) : Pointer(LibC::Char)
  fun gtk_notebook_get_n_pages(this : Void*) : Int32
  fun gtk_notebook_get_nth_page(this : Void*, page_num : Int32) : Pointer(Void)
  fun gtk_notebook_get_page(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun gtk_notebook_get_pages(this : Void*) : Pointer(Void)
  fun gtk_notebook_get_scrollable(this : Void*) : LibC::Int
  fun gtk_notebook_get_show_border(this : Void*) : LibC::Int
  fun gtk_notebook_get_show_tabs(this : Void*) : LibC::Int
  fun gtk_notebook_get_tab_detachable(this : Void*, child : Pointer(Void)) : LibC::Int
  fun gtk_notebook_get_tab_label(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun gtk_notebook_get_tab_label_text(this : Void*, child : Pointer(Void)) : Pointer(LibC::Char)
  fun gtk_notebook_get_tab_pos(this : Void*) : UInt32
  fun gtk_notebook_get_tab_reorderable(this : Void*, child : Pointer(Void)) : LibC::Int
  fun gtk_notebook_get_type : UInt64
  fun gtk_notebook_insert_page(this : Void*, child : Pointer(Void), tab_label : Pointer(Void), position : Int32) : Int32
  fun gtk_notebook_insert_page_menu(this : Void*, child : Pointer(Void), tab_label : Pointer(Void), menu_label : Pointer(Void), position : Int32) : Int32
  fun gtk_notebook_new : Pointer(Void)
  fun gtk_notebook_next_page(this : Void*) : Void
  fun gtk_notebook_page_get_child(this : Void*) : Pointer(Void)
  fun gtk_notebook_page_get_type : UInt64
  fun gtk_notebook_page_num(this : Void*, child : Pointer(Void)) : Int32
  fun gtk_notebook_popup_disable(this : Void*) : Void
  fun gtk_notebook_popup_enable(this : Void*) : Void
  fun gtk_notebook_prepend_page(this : Void*, child : Pointer(Void), tab_label : Pointer(Void)) : Int32
  fun gtk_notebook_prepend_page_menu(this : Void*, child : Pointer(Void), tab_label : Pointer(Void), menu_label : Pointer(Void)) : Int32
  fun gtk_notebook_prev_page(this : Void*) : Void
  fun gtk_notebook_remove_page(this : Void*, page_num : Int32) : Void
  fun gtk_notebook_reorder_child(this : Void*, child : Pointer(Void), position : Int32) : Void
  fun gtk_notebook_set_action_widget(this : Void*, widget : Pointer(Void), pack_type : UInt32) : Void
  fun gtk_notebook_set_current_page(this : Void*, page_num : Int32) : Void
  fun gtk_notebook_set_group_name(this : Void*, group_name : Pointer(LibC::Char)) : Void
  fun gtk_notebook_set_menu_label(this : Void*, child : Pointer(Void), menu_label : Pointer(Void)) : Void
  fun gtk_notebook_set_menu_label_text(this : Void*, child : Pointer(Void), menu_text : Pointer(LibC::Char)) : Void
  fun gtk_notebook_set_scrollable(this : Void*, scrollable : LibC::Int) : Void
  fun gtk_notebook_set_show_border(this : Void*, show_border : LibC::Int) : Void
  fun gtk_notebook_set_show_tabs(this : Void*, show_tabs : LibC::Int) : Void
  fun gtk_notebook_set_tab_detachable(this : Void*, child : Pointer(Void), detachable : LibC::Int) : Void
  fun gtk_notebook_set_tab_label(this : Void*, child : Pointer(Void), tab_label : Pointer(Void)) : Void
  fun gtk_notebook_set_tab_label_text(this : Void*, child : Pointer(Void), tab_text : Pointer(LibC::Char)) : Void
  fun gtk_notebook_set_tab_pos(this : Void*, pos : UInt32) : Void
  fun gtk_notebook_set_tab_reorderable(this : Void*, child : Pointer(Void), reorderable : LibC::Int) : Void
  fun gtk_nothing_action_get : Pointer(Void)
  fun gtk_nothing_action_get_type : UInt64
  fun gtk_numeric_sorter_get_expression(this : Void*) : Pointer(Void)
  fun gtk_numeric_sorter_get_sort_order(this : Void*) : UInt32
  fun gtk_numeric_sorter_get_type : UInt64
  fun gtk_numeric_sorter_new(expression : Pointer(Void)) : Pointer(Void)
  fun gtk_numeric_sorter_set_expression(this : Void*, expression : Pointer(Void)) : Void
  fun gtk_numeric_sorter_set_sort_order(this : Void*, sort_order : UInt32) : Void
  fun gtk_object_expression_get_object(this : Void*) : Pointer(Void)
  fun gtk_object_expression_get_type : UInt64
  fun gtk_object_expression_new(object : Pointer(Void)) : Pointer(Void)
  fun gtk_ordering_from_cmpfunc(cmpfunc_result : Int32) : Int32
  fun gtk_orientable_get_orientation(this : Void*) : UInt32
  fun gtk_orientable_get_type : UInt64
  fun gtk_orientable_set_orientation(this : Void*, orientation : UInt32) : Void
  fun gtk_overlay_add_overlay(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_overlay_get_child(this : Void*) : Pointer(Void)
  fun gtk_overlay_get_clip_overlay(this : Void*, widget : Pointer(Void)) : LibC::Int
  fun gtk_overlay_get_measure_overlay(this : Void*, widget : Pointer(Void)) : LibC::Int
  fun gtk_overlay_get_type : UInt64
  fun gtk_overlay_layout_child_get_clip_overlay(this : Void*) : LibC::Int
  fun gtk_overlay_layout_child_get_measure(this : Void*) : LibC::Int
  fun gtk_overlay_layout_child_get_type : UInt64
  fun gtk_overlay_layout_child_set_clip_overlay(this : Void*, clip_overlay : LibC::Int) : Void
  fun gtk_overlay_layout_child_set_measure(this : Void*, measure : LibC::Int) : Void
  fun gtk_overlay_layout_get_type : UInt64
  fun gtk_overlay_layout_new : Pointer(Void)
  fun gtk_overlay_new : Pointer(Void)
  fun gtk_overlay_remove_overlay(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_overlay_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_overlay_set_clip_overlay(this : Void*, widget : Pointer(Void), clip_overlay : LibC::Int) : Void
  fun gtk_overlay_set_measure_overlay(this : Void*, widget : Pointer(Void), measure : LibC::Int) : Void
  fun gtk_pad_controller_get_type : UInt64
  fun gtk_pad_controller_new(group : Pointer(Void), pad : Pointer(Void)) : Pointer(Void)
  fun gtk_pad_controller_set_action(this : Void*, type : UInt32, index : Int32, mode : Int32, label : Pointer(LibC::Char), action_name : Pointer(LibC::Char)) : Void
  fun gtk_pad_controller_set_action_entries(this : Void*, entries : Pointer(Void), n_entries : Int32) : Void
  fun gtk_page_setup_copy(this : Void*) : Pointer(Void)
  fun gtk_page_setup_get_bottom_margin(this : Void*, unit : UInt32) : Float64
  fun gtk_page_setup_get_left_margin(this : Void*, unit : UInt32) : Float64
  fun gtk_page_setup_get_orientation(this : Void*) : UInt32
  fun gtk_page_setup_get_page_height(this : Void*, unit : UInt32) : Float64
  fun gtk_page_setup_get_page_width(this : Void*, unit : UInt32) : Float64
  fun gtk_page_setup_get_paper_height(this : Void*, unit : UInt32) : Float64
  fun gtk_page_setup_get_paper_size(this : Void*) : Pointer(Void)
  fun gtk_page_setup_get_paper_width(this : Void*, unit : UInt32) : Float64
  fun gtk_page_setup_get_right_margin(this : Void*, unit : UInt32) : Float64
  fun gtk_page_setup_get_top_margin(this : Void*, unit : UInt32) : Float64
  fun gtk_page_setup_get_type : UInt64
  fun gtk_page_setup_load_file(this : Void*, file_name : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun gtk_page_setup_load_key_file(this : Void*, key_file : Pointer(Void), group_name : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun gtk_page_setup_new : Pointer(Void)
  fun gtk_page_setup_new_from_file(file_name : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun gtk_page_setup_new_from_gvariant(variant : Pointer(Void)) : Pointer(Void)
  fun gtk_page_setup_new_from_key_file(key_file : Pointer(Void), group_name : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun gtk_page_setup_set_bottom_margin(this : Void*, margin : Float64, unit : UInt32) : Void
  fun gtk_page_setup_set_left_margin(this : Void*, margin : Float64, unit : UInt32) : Void
  fun gtk_page_setup_set_orientation(this : Void*, orientation : UInt32) : Void
  fun gtk_page_setup_set_paper_size(this : Void*, size : Pointer(Void)) : Void
  fun gtk_page_setup_set_paper_size_and_default_margins(this : Void*, size : Pointer(Void)) : Void
  fun gtk_page_setup_set_right_margin(this : Void*, margin : Float64, unit : UInt32) : Void
  fun gtk_page_setup_set_top_margin(this : Void*, margin : Float64, unit : UInt32) : Void
  fun gtk_page_setup_to_file(this : Void*, file_name : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun gtk_page_setup_to_gvariant(this : Void*) : Pointer(Void)
  fun gtk_page_setup_to_key_file(this : Void*, key_file : Pointer(Void), group_name : Pointer(LibC::Char)) : Void
  fun gtk_page_setup_unix_dialog_get_page_setup(this : Void*) : Pointer(Void)
  fun gtk_page_setup_unix_dialog_get_print_settings(this : Void*) : Pointer(Void)
  fun gtk_page_setup_unix_dialog_get_type : UInt64
  fun gtk_page_setup_unix_dialog_new(title : Pointer(LibC::Char), parent : Pointer(Void)) : Pointer(Void)
  fun gtk_page_setup_unix_dialog_set_page_setup(this : Void*, page_setup : Pointer(Void)) : Void
  fun gtk_page_setup_unix_dialog_set_print_settings(this : Void*, print_settings : Pointer(Void)) : Void
  fun gtk_paned_get_end_child(this : Void*) : Pointer(Void)
  fun gtk_paned_get_position(this : Void*) : Int32
  fun gtk_paned_get_resize_end_child(this : Void*) : LibC::Int
  fun gtk_paned_get_resize_start_child(this : Void*) : LibC::Int
  fun gtk_paned_get_shrink_end_child(this : Void*) : LibC::Int
  fun gtk_paned_get_shrink_start_child(this : Void*) : LibC::Int
  fun gtk_paned_get_start_child(this : Void*) : Pointer(Void)
  fun gtk_paned_get_type : UInt64
  fun gtk_paned_get_wide_handle(this : Void*) : LibC::Int
  fun gtk_paned_new(orientation : UInt32) : Pointer(Void)
  fun gtk_paned_set_end_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_paned_set_position(this : Void*, position : Int32) : Void
  fun gtk_paned_set_resize_end_child(this : Void*, resize : LibC::Int) : Void
  fun gtk_paned_set_resize_start_child(this : Void*, resize : LibC::Int) : Void
  fun gtk_paned_set_shrink_end_child(this : Void*, resize : LibC::Int) : Void
  fun gtk_paned_set_shrink_start_child(this : Void*, resize : LibC::Int) : Void
  fun gtk_paned_set_start_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_paned_set_wide_handle(this : Void*, wide : LibC::Int) : Void
  fun gtk_paper_size_copy(this : Void*) : Pointer(Void)
  fun gtk_paper_size_free(this : Void*) : Void
  fun gtk_paper_size_get_default : Pointer(LibC::Char)
  fun gtk_paper_size_get_default : Pointer(LibC::Char)
  fun gtk_paper_size_get_default_bottom_margin(this : Void*, unit : UInt32) : Float64
  fun gtk_paper_size_get_default_left_margin(this : Void*, unit : UInt32) : Float64
  fun gtk_paper_size_get_default_right_margin(this : Void*, unit : UInt32) : Float64
  fun gtk_paper_size_get_default_top_margin(this : Void*, unit : UInt32) : Float64
  fun gtk_paper_size_get_display_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_paper_size_get_height(this : Void*, unit : UInt32) : Float64
  fun gtk_paper_size_get_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_paper_size_get_paper_sizes(include_custom : LibC::Int) : Pointer(LibGLib::List)
  fun gtk_paper_size_get_paper_sizes(include_custom : LibC::Int) : Pointer(LibGLib::List)
  fun gtk_paper_size_get_ppd_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_paper_size_get_type : UInt64
  fun gtk_paper_size_get_width(this : Void*, unit : UInt32) : Float64
  fun gtk_paper_size_is_custom(this : Void*) : LibC::Int
  fun gtk_paper_size_is_equal(this : Void*, size2 : Pointer(Void)) : LibC::Int
  fun gtk_paper_size_is_ipp(this : Void*) : LibC::Int
  fun gtk_paper_size_new(name : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_paper_size_new_custom(name : Pointer(LibC::Char), display_name : Pointer(LibC::Char), width : Float64, height : Float64, unit : UInt32) : Pointer(Void)
  fun gtk_paper_size_new_from_gvariant(variant : Pointer(Void)) : Pointer(Void)
  fun gtk_paper_size_new_from_ipp(ipp_name : Pointer(LibC::Char), width : Float64, height : Float64) : Pointer(Void)
  fun gtk_paper_size_new_from_key_file(key_file : Pointer(Void), group_name : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun gtk_paper_size_new_from_ppd(ppd_name : Pointer(LibC::Char), ppd_display_name : Pointer(LibC::Char), width : Float64, height : Float64) : Pointer(Void)
  fun gtk_paper_size_set_size(this : Void*, width : Float64, height : Float64, unit : UInt32) : Void
  fun gtk_paper_size_to_gvariant(this : Void*) : Pointer(Void)
  fun gtk_paper_size_to_key_file(this : Void*, key_file : Pointer(Void), group_name : Pointer(LibC::Char)) : Void
  fun gtk_param_expression_get_type : UInt64
  fun gtk_param_spec_expression(name : Pointer(LibC::Char), nick : Pointer(LibC::Char), blurb : Pointer(LibC::Char), flags : UInt32) : Pointer(Void)
  fun gtk_password_entry_buffer_get_type : UInt64
  fun gtk_password_entry_buffer_new : Pointer(Void)
  fun gtk_password_entry_get_extra_menu(this : Void*) : Pointer(Void)
  fun gtk_password_entry_get_show_peek_icon(this : Void*) : LibC::Int
  fun gtk_password_entry_get_type : UInt64
  fun gtk_password_entry_new : Pointer(Void)
  fun gtk_password_entry_set_extra_menu(this : Void*, model : Pointer(Void)) : Void
  fun gtk_password_entry_set_show_peek_icon(this : Void*, show_peek_icon : LibC::Int) : Void
  fun gtk_picture_get_alternative_text(this : Void*) : Pointer(LibC::Char)
  fun gtk_picture_get_can_shrink(this : Void*) : LibC::Int
  fun gtk_picture_get_file(this : Void*) : Pointer(Void)
  fun gtk_picture_get_keep_aspect_ratio(this : Void*) : LibC::Int
  fun gtk_picture_get_paintable(this : Void*) : Pointer(Void)
  fun gtk_picture_get_type : UInt64
  fun gtk_picture_new : Pointer(Void)
  fun gtk_picture_new_for_file(file : Pointer(Void)) : Pointer(Void)
  fun gtk_picture_new_for_filename(filename : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_picture_new_for_paintable(paintable : Pointer(Void)) : Pointer(Void)
  fun gtk_picture_new_for_pixbuf(pixbuf : Pointer(Void)) : Pointer(Void)
  fun gtk_picture_new_for_resource(resource_path : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_picture_set_alternative_text(this : Void*, alternative_text : Pointer(LibC::Char)) : Void
  fun gtk_picture_set_can_shrink(this : Void*, can_shrink : LibC::Int) : Void
  fun gtk_picture_set_file(this : Void*, file : Pointer(Void)) : Void
  fun gtk_picture_set_filename(this : Void*, filename : Pointer(LibC::Char)) : Void
  fun gtk_picture_set_keep_aspect_ratio(this : Void*, keep_aspect_ratio : LibC::Int) : Void
  fun gtk_picture_set_paintable(this : Void*, paintable : Pointer(Void)) : Void
  fun gtk_picture_set_pixbuf(this : Void*, pixbuf : Pointer(Void)) : Void
  fun gtk_picture_set_resource(this : Void*, resource_path : Pointer(LibC::Char)) : Void
  fun gtk_popover_get_autohide(this : Void*) : LibC::Int
  fun gtk_popover_get_cascade_popdown(this : Void*) : LibC::Int
  fun gtk_popover_get_child(this : Void*) : Pointer(Void)
  fun gtk_popover_get_has_arrow(this : Void*) : LibC::Int
  fun gtk_popover_get_mnemonics_visible(this : Void*) : LibC::Int
  fun gtk_popover_get_offset(this : Void*, x_offset : Pointer(Int32), y_offset : Pointer(Int32)) : Void
  fun gtk_popover_get_pointing_to(this : Void*, rect : Pointer(Void)) : LibC::Int
  fun gtk_popover_get_position(this : Void*) : UInt32
  fun gtk_popover_get_type : UInt64
  fun gtk_popover_menu_add_child(this : Void*, child : Pointer(Void), id : Pointer(LibC::Char)) : LibC::Int
  fun gtk_popover_menu_bar_add_child(this : Void*, child : Pointer(Void), id : Pointer(LibC::Char)) : LibC::Int
  fun gtk_popover_menu_bar_get_menu_model(this : Void*) : Pointer(Void)
  fun gtk_popover_menu_bar_get_type : UInt64
  fun gtk_popover_menu_bar_new_from_model(model : Pointer(Void)) : Pointer(Void)
  fun gtk_popover_menu_bar_remove_child(this : Void*, child : Pointer(Void)) : LibC::Int
  fun gtk_popover_menu_bar_set_menu_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_popover_menu_get_menu_model(this : Void*) : Pointer(Void)
  fun gtk_popover_menu_get_type : UInt64
  fun gtk_popover_menu_new_from_model(model : Pointer(Void)) : Pointer(Void)
  fun gtk_popover_menu_new_from_model_full(model : Pointer(Void), flags : UInt32) : Pointer(Void)
  fun gtk_popover_menu_remove_child(this : Void*, child : Pointer(Void)) : LibC::Int
  fun gtk_popover_menu_set_menu_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_popover_new : Pointer(Void)
  fun gtk_popover_popdown(this : Void*) : Void
  fun gtk_popover_popup(this : Void*) : Void
  fun gtk_popover_present(this : Void*) : Void
  fun gtk_popover_set_autohide(this : Void*, autohide : LibC::Int) : Void
  fun gtk_popover_set_cascade_popdown(this : Void*, cascade_popdown : LibC::Int) : Void
  fun gtk_popover_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_popover_set_default_widget(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_popover_set_has_arrow(this : Void*, has_arrow : LibC::Int) : Void
  fun gtk_popover_set_mnemonics_visible(this : Void*, mnemonics_visible : LibC::Int) : Void
  fun gtk_popover_set_offset(this : Void*, x_offset : Int32, y_offset : Int32) : Void
  fun gtk_popover_set_pointing_to(this : Void*, rect : Pointer(Void)) : Void
  fun gtk_popover_set_position(this : Void*, position : UInt32) : Void
  fun gtk_print_context_create_pango_context(this : Void*) : Pointer(Void)
  fun gtk_print_context_create_pango_layout(this : Void*) : Pointer(Void)
  fun gtk_print_context_get_cairo_context(this : Void*) : Pointer(Void)
  fun gtk_print_context_get_dpi_x(this : Void*) : Float64
  fun gtk_print_context_get_dpi_y(this : Void*) : Float64
  fun gtk_print_context_get_hard_margins(this : Void*, top : Pointer(Float64), bottom : Pointer(Float64), left : Pointer(Float64), right : Pointer(Float64)) : LibC::Int
  fun gtk_print_context_get_height(this : Void*) : Float64
  fun gtk_print_context_get_page_setup(this : Void*) : Pointer(Void)
  fun gtk_print_context_get_pango_fontmap(this : Void*) : Pointer(Void)
  fun gtk_print_context_get_type : UInt64
  fun gtk_print_context_get_width(this : Void*) : Float64
  fun gtk_print_context_set_cairo_context(this : Void*, cr : Pointer(Void), dpi_x : Float64, dpi_y : Float64) : Void
  fun gtk_print_error_quark : UInt32
  fun gtk_print_job_get_collate(this : Void*) : LibC::Int
  fun gtk_print_job_get_n_up(this : Void*) : UInt32
  fun gtk_print_job_get_n_up_layout(this : Void*) : UInt32
  fun gtk_print_job_get_num_copies(this : Void*) : Int32
  fun gtk_print_job_get_page_ranges(this : Void*, n_ranges : Pointer(Int32)) : Pointer(Void)
  fun gtk_print_job_get_page_set(this : Void*) : UInt32
  fun gtk_print_job_get_pages(this : Void*) : UInt32
  fun gtk_print_job_get_printer(this : Void*) : Pointer(Void)
  fun gtk_print_job_get_reverse(this : Void*) : LibC::Int
  fun gtk_print_job_get_rotate(this : Void*) : LibC::Int
  fun gtk_print_job_get_scale(this : Void*) : Float64
  fun gtk_print_job_get_settings(this : Void*) : Pointer(Void)
  fun gtk_print_job_get_status(this : Void*) : UInt32
  fun gtk_print_job_get_surface(this : Void*, error : LibGLib::Error**) : Pointer(Void)
  fun gtk_print_job_get_title(this : Void*) : Pointer(LibC::Char)
  fun gtk_print_job_get_track_print_status(this : Void*) : LibC::Int
  fun gtk_print_job_get_type : UInt64
  fun gtk_print_job_new(title : Pointer(LibC::Char), printer : Pointer(Void), settings : Pointer(Void), page_setup : Pointer(Void)) : Pointer(Void)
  fun gtk_print_job_send(this : Void*, callback : PrintJobCompleteFunc, user_data : Pointer(Void), dnotify : LibGLib::DestroyNotify) : Void
  fun gtk_print_job_set_collate(this : Void*, collate : LibC::Int) : Void
  fun gtk_print_job_set_n_up(this : Void*, n_up : UInt32) : Void
  fun gtk_print_job_set_n_up_layout(this : Void*, layout : UInt32) : Void
  fun gtk_print_job_set_num_copies(this : Void*, num_copies : Int32) : Void
  fun gtk_print_job_set_page_ranges(this : Void*, ranges : Pointer(Void), n_ranges : Int32) : Void
  fun gtk_print_job_set_page_set(this : Void*, page_set : UInt32) : Void
  fun gtk_print_job_set_pages(this : Void*, pages : UInt32) : Void
  fun gtk_print_job_set_reverse(this : Void*, reverse : LibC::Int) : Void
  fun gtk_print_job_set_rotate(this : Void*, rotate : LibC::Int) : Void
  fun gtk_print_job_set_scale(this : Void*, scale : Float64) : Void
  fun gtk_print_job_set_source_fd(this : Void*, fd : Int32, error : LibGLib::Error**) : LibC::Int
  fun gtk_print_job_set_source_file(this : Void*, filename : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun gtk_print_job_set_track_print_status(this : Void*, track_status : LibC::Int) : Void
  fun gtk_print_operation_cancel(this : Void*) : Void
  fun gtk_print_operation_draw_page_finish(this : Void*) : Void
  fun gtk_print_operation_get_default_page_setup(this : Void*) : Pointer(Void)
  fun gtk_print_operation_get_embed_page_setup(this : Void*) : LibC::Int
  fun gtk_print_operation_get_error(this : Void*, error : LibGLib::Error**) : Void
  fun gtk_print_operation_get_has_selection(this : Void*) : LibC::Int
  fun gtk_print_operation_get_n_pages_to_print(this : Void*) : Int32
  fun gtk_print_operation_get_print_settings(this : Void*) : Pointer(Void)
  fun gtk_print_operation_get_status(this : Void*) : UInt32
  fun gtk_print_operation_get_status_string(this : Void*) : Pointer(LibC::Char)
  fun gtk_print_operation_get_support_selection(this : Void*) : LibC::Int
  fun gtk_print_operation_get_type : UInt64
  fun gtk_print_operation_is_finished(this : Void*) : LibC::Int
  fun gtk_print_operation_new : Pointer(Void)
  fun gtk_print_operation_preview_end_preview(this : Void*) : Void
  fun gtk_print_operation_preview_get_type : UInt64
  fun gtk_print_operation_preview_is_selected(this : Void*, page_nr : Int32) : LibC::Int
  fun gtk_print_operation_preview_render_page(this : Void*, page_nr : Int32) : Void
  fun gtk_print_operation_run(this : Void*, action : UInt32, parent : Pointer(Void), error : LibGLib::Error**) : UInt32
  fun gtk_print_operation_set_allow_async(this : Void*, allow_async : LibC::Int) : Void
  fun gtk_print_operation_set_current_page(this : Void*, current_page : Int32) : Void
  fun gtk_print_operation_set_custom_tab_label(this : Void*, label : Pointer(LibC::Char)) : Void
  fun gtk_print_operation_set_default_page_setup(this : Void*, default_page_setup : Pointer(Void)) : Void
  fun gtk_print_operation_set_defer_drawing(this : Void*) : Void
  fun gtk_print_operation_set_embed_page_setup(this : Void*, embed : LibC::Int) : Void
  fun gtk_print_operation_set_export_filename(this : Void*, filename : Pointer(LibC::Char)) : Void
  fun gtk_print_operation_set_has_selection(this : Void*, has_selection : LibC::Int) : Void
  fun gtk_print_operation_set_job_name(this : Void*, job_name : Pointer(LibC::Char)) : Void
  fun gtk_print_operation_set_n_pages(this : Void*, n_pages : Int32) : Void
  fun gtk_print_operation_set_print_settings(this : Void*, print_settings : Pointer(Void)) : Void
  fun gtk_print_operation_set_show_progress(this : Void*, show_progress : LibC::Int) : Void
  fun gtk_print_operation_set_support_selection(this : Void*, support_selection : LibC::Int) : Void
  fun gtk_print_operation_set_track_print_status(this : Void*, track_status : LibC::Int) : Void
  fun gtk_print_operation_set_unit(this : Void*, unit : UInt32) : Void
  fun gtk_print_operation_set_use_full_page(this : Void*, full_page : LibC::Int) : Void
  fun gtk_print_run_page_setup_dialog(parent : Pointer(Void), page_setup : Pointer(Void), settings : Pointer(Void)) : Pointer(Void)
  fun gtk_print_run_page_setup_dialog_async(parent : Pointer(Void), page_setup : Pointer(Void), settings : Pointer(Void), done_cb : PageSetupDoneFunc, data : Pointer(Void)) : Void
  fun gtk_print_settings_copy(this : Void*) : Pointer(Void)
  fun gtk_print_settings_foreach(this : Void*, func : PrintSettingsFunc, user_data : Pointer(Void)) : Void
  fun gtk_print_settings_get(this : Void*, key : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun gtk_print_settings_get_bool(this : Void*, key : Pointer(LibC::Char)) : LibC::Int
  fun gtk_print_settings_get_collate(this : Void*) : LibC::Int
  fun gtk_print_settings_get_default_source(this : Void*) : Pointer(LibC::Char)
  fun gtk_print_settings_get_dither(this : Void*) : Pointer(LibC::Char)
  fun gtk_print_settings_get_double(this : Void*, key : Pointer(LibC::Char)) : Float64
  fun gtk_print_settings_get_double_with_default(this : Void*, key : Pointer(LibC::Char), _def : Float64) : Float64
  fun gtk_print_settings_get_duplex(this : Void*) : UInt32
  fun gtk_print_settings_get_finishings(this : Void*) : Pointer(LibC::Char)
  fun gtk_print_settings_get_int(this : Void*, key : Pointer(LibC::Char)) : Int32
  fun gtk_print_settings_get_int_with_default(this : Void*, key : Pointer(LibC::Char), _def : Int32) : Int32
  fun gtk_print_settings_get_length(this : Void*, key : Pointer(LibC::Char), unit : UInt32) : Float64
  fun gtk_print_settings_get_media_type(this : Void*) : Pointer(LibC::Char)
  fun gtk_print_settings_get_n_copies(this : Void*) : Int32
  fun gtk_print_settings_get_number_up(this : Void*) : Int32
  fun gtk_print_settings_get_number_up_layout(this : Void*) : UInt32
  fun gtk_print_settings_get_orientation(this : Void*) : UInt32
  fun gtk_print_settings_get_output_bin(this : Void*) : Pointer(LibC::Char)
  fun gtk_print_settings_get_page_ranges(this : Void*, num_ranges : Pointer(Int32)) : Pointer(Void)
  fun gtk_print_settings_get_page_set(this : Void*) : UInt32
  fun gtk_print_settings_get_paper_height(this : Void*, unit : UInt32) : Float64
  fun gtk_print_settings_get_paper_size(this : Void*) : Pointer(Void)
  fun gtk_print_settings_get_paper_width(this : Void*, unit : UInt32) : Float64
  fun gtk_print_settings_get_print_pages(this : Void*) : UInt32
  fun gtk_print_settings_get_printer(this : Void*) : Pointer(LibC::Char)
  fun gtk_print_settings_get_printer_lpi(this : Void*) : Float64
  fun gtk_print_settings_get_quality(this : Void*) : UInt32
  fun gtk_print_settings_get_resolution(this : Void*) : Int32
  fun gtk_print_settings_get_resolution_x(this : Void*) : Int32
  fun gtk_print_settings_get_resolution_y(this : Void*) : Int32
  fun gtk_print_settings_get_reverse(this : Void*) : LibC::Int
  fun gtk_print_settings_get_scale(this : Void*) : Float64
  fun gtk_print_settings_get_type : UInt64
  fun gtk_print_settings_get_use_color(this : Void*) : LibC::Int
  fun gtk_print_settings_has_key(this : Void*, key : Pointer(LibC::Char)) : LibC::Int
  fun gtk_print_settings_load_file(this : Void*, file_name : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun gtk_print_settings_load_key_file(this : Void*, key_file : Pointer(Void), group_name : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun gtk_print_settings_new : Pointer(Void)
  fun gtk_print_settings_new_from_file(file_name : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun gtk_print_settings_new_from_gvariant(variant : Pointer(Void)) : Pointer(Void)
  fun gtk_print_settings_new_from_key_file(key_file : Pointer(Void), group_name : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun gtk_print_settings_set(this : Void*, key : Pointer(LibC::Char), value : Pointer(LibC::Char)) : Void
  fun gtk_print_settings_set_bool(this : Void*, key : Pointer(LibC::Char), value : LibC::Int) : Void
  fun gtk_print_settings_set_collate(this : Void*, collate : LibC::Int) : Void
  fun gtk_print_settings_set_default_source(this : Void*, default_source : Pointer(LibC::Char)) : Void
  fun gtk_print_settings_set_dither(this : Void*, dither : Pointer(LibC::Char)) : Void
  fun gtk_print_settings_set_double(this : Void*, key : Pointer(LibC::Char), value : Float64) : Void
  fun gtk_print_settings_set_duplex(this : Void*, duplex : UInt32) : Void
  fun gtk_print_settings_set_finishings(this : Void*, finishings : Pointer(LibC::Char)) : Void
  fun gtk_print_settings_set_int(this : Void*, key : Pointer(LibC::Char), value : Int32) : Void
  fun gtk_print_settings_set_length(this : Void*, key : Pointer(LibC::Char), value : Float64, unit : UInt32) : Void
  fun gtk_print_settings_set_media_type(this : Void*, media_type : Pointer(LibC::Char)) : Void
  fun gtk_print_settings_set_n_copies(this : Void*, num_copies : Int32) : Void
  fun gtk_print_settings_set_number_up(this : Void*, number_up : Int32) : Void
  fun gtk_print_settings_set_number_up_layout(this : Void*, number_up_layout : UInt32) : Void
  fun gtk_print_settings_set_orientation(this : Void*, orientation : UInt32) : Void
  fun gtk_print_settings_set_output_bin(this : Void*, output_bin : Pointer(LibC::Char)) : Void
  fun gtk_print_settings_set_page_ranges(this : Void*, page_ranges : Pointer(Void), num_ranges : Int32) : Void
  fun gtk_print_settings_set_page_set(this : Void*, page_set : UInt32) : Void
  fun gtk_print_settings_set_paper_height(this : Void*, height : Float64, unit : UInt32) : Void
  fun gtk_print_settings_set_paper_size(this : Void*, paper_size : Pointer(Void)) : Void
  fun gtk_print_settings_set_paper_width(this : Void*, width : Float64, unit : UInt32) : Void
  fun gtk_print_settings_set_print_pages(this : Void*, pages : UInt32) : Void
  fun gtk_print_settings_set_printer(this : Void*, printer : Pointer(LibC::Char)) : Void
  fun gtk_print_settings_set_printer_lpi(this : Void*, lpi : Float64) : Void
  fun gtk_print_settings_set_quality(this : Void*, quality : UInt32) : Void
  fun gtk_print_settings_set_resolution(this : Void*, resolution : Int32) : Void
  fun gtk_print_settings_set_resolution_xy(this : Void*, resolution_x : Int32, resolution_y : Int32) : Void
  fun gtk_print_settings_set_reverse(this : Void*, reverse : LibC::Int) : Void
  fun gtk_print_settings_set_scale(this : Void*, scale : Float64) : Void
  fun gtk_print_settings_set_use_color(this : Void*, use_color : LibC::Int) : Void
  fun gtk_print_settings_to_file(this : Void*, file_name : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun gtk_print_settings_to_gvariant(this : Void*) : Pointer(Void)
  fun gtk_print_settings_to_key_file(this : Void*, key_file : Pointer(Void), group_name : Pointer(LibC::Char)) : Void
  fun gtk_print_settings_unset(this : Void*, key : Pointer(LibC::Char)) : Void
  fun gtk_print_unix_dialog_add_custom_tab(this : Void*, child : Pointer(Void), tab_label : Pointer(Void)) : Void
  fun gtk_print_unix_dialog_get_current_page(this : Void*) : Int32
  fun gtk_print_unix_dialog_get_embed_page_setup(this : Void*) : LibC::Int
  fun gtk_print_unix_dialog_get_has_selection(this : Void*) : LibC::Int
  fun gtk_print_unix_dialog_get_manual_capabilities(this : Void*) : UInt32
  fun gtk_print_unix_dialog_get_page_setup(this : Void*) : Pointer(Void)
  fun gtk_print_unix_dialog_get_page_setup_set(this : Void*) : LibC::Int
  fun gtk_print_unix_dialog_get_selected_printer(this : Void*) : Pointer(Void)
  fun gtk_print_unix_dialog_get_settings(this : Void*) : Pointer(Void)
  fun gtk_print_unix_dialog_get_support_selection(this : Void*) : LibC::Int
  fun gtk_print_unix_dialog_get_type : UInt64
  fun gtk_print_unix_dialog_new(title : Pointer(LibC::Char), parent : Pointer(Void)) : Pointer(Void)
  fun gtk_print_unix_dialog_set_current_page(this : Void*, current_page : Int32) : Void
  fun gtk_print_unix_dialog_set_embed_page_setup(this : Void*, embed : LibC::Int) : Void
  fun gtk_print_unix_dialog_set_has_selection(this : Void*, has_selection : LibC::Int) : Void
  fun gtk_print_unix_dialog_set_manual_capabilities(this : Void*, capabilities : UInt32) : Void
  fun gtk_print_unix_dialog_set_page_setup(this : Void*, page_setup : Pointer(Void)) : Void
  fun gtk_print_unix_dialog_set_settings(this : Void*, settings : Pointer(Void)) : Void
  fun gtk_print_unix_dialog_set_support_selection(this : Void*, support_selection : LibC::Int) : Void
  fun gtk_printer_accepts_pdf(this : Void*) : LibC::Int
  fun gtk_printer_accepts_ps(this : Void*) : LibC::Int
  fun gtk_printer_compare(this : Void*, b : Pointer(Void)) : Int32
  fun gtk_printer_get_backend(this : Void*) : Pointer(Void)
  fun gtk_printer_get_capabilities(this : Void*) : UInt32
  fun gtk_printer_get_default_page_size(this : Void*) : Pointer(Void)
  fun gtk_printer_get_description(this : Void*) : Pointer(LibC::Char)
  fun gtk_printer_get_hard_margins(this : Void*, top : Pointer(Float64), bottom : Pointer(Float64), left : Pointer(Float64), right : Pointer(Float64)) : LibC::Int
  fun gtk_printer_get_hard_margins_for_paper_size(this : Void*, paper_size : Pointer(Void), top : Pointer(Float64), bottom : Pointer(Float64), left : Pointer(Float64), right : Pointer(Float64)) : LibC::Int
  fun gtk_printer_get_icon_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_printer_get_job_count(this : Void*) : Int32
  fun gtk_printer_get_location(this : Void*) : Pointer(LibC::Char)
  fun gtk_printer_get_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_printer_get_state_message(this : Void*) : Pointer(LibC::Char)
  fun gtk_printer_get_type : UInt64
  fun gtk_printer_has_details(this : Void*) : LibC::Int
  fun gtk_printer_is_accepting_jobs(this : Void*) : LibC::Int
  fun gtk_printer_is_active(this : Void*) : LibC::Int
  fun gtk_printer_is_default(this : Void*) : LibC::Int
  fun gtk_printer_is_paused(this : Void*) : LibC::Int
  fun gtk_printer_is_virtual(this : Void*) : LibC::Int
  fun gtk_printer_list_papers(this : Void*) : Pointer(LibGLib::List)
  fun gtk_printer_new(name : Pointer(LibC::Char), backend : Pointer(Void), virtual_ : LibC::Int) : Pointer(Void)
  fun gtk_printer_request_details(this : Void*) : Void
  fun gtk_progress_bar_get_ellipsize(this : Void*) : UInt32
  fun gtk_progress_bar_get_fraction(this : Void*) : Float64
  fun gtk_progress_bar_get_inverted(this : Void*) : LibC::Int
  fun gtk_progress_bar_get_pulse_step(this : Void*) : Float64
  fun gtk_progress_bar_get_show_text(this : Void*) : LibC::Int
  fun gtk_progress_bar_get_text(this : Void*) : Pointer(LibC::Char)
  fun gtk_progress_bar_get_type : UInt64
  fun gtk_progress_bar_new : Pointer(Void)
  fun gtk_progress_bar_pulse(this : Void*) : Void
  fun gtk_progress_bar_set_ellipsize(this : Void*, mode : UInt32) : Void
  fun gtk_progress_bar_set_fraction(this : Void*, fraction : Float64) : Void
  fun gtk_progress_bar_set_inverted(this : Void*, inverted : LibC::Int) : Void
  fun gtk_progress_bar_set_pulse_step(this : Void*, fraction : Float64) : Void
  fun gtk_progress_bar_set_show_text(this : Void*, show_text : LibC::Int) : Void
  fun gtk_progress_bar_set_text(this : Void*, text : Pointer(LibC::Char)) : Void
  fun gtk_property_expression_get_expression(this : Void*) : Pointer(Void)
  fun gtk_property_expression_get_pspec(this : Void*) : Pointer(Void)
  fun gtk_property_expression_get_type : UInt64
  fun gtk_property_expression_new(this_type : UInt64, expression : Pointer(Void), property_name : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_property_expression_new_for_pspec(expression : Pointer(Void), pspec : Pointer(Void)) : Pointer(Void)
  fun gtk_range_get_adjustment(this : Void*) : Pointer(Void)
  fun gtk_range_get_fill_level(this : Void*) : Float64
  fun gtk_range_get_flippable(this : Void*) : LibC::Int
  fun gtk_range_get_inverted(this : Void*) : LibC::Int
  fun gtk_range_get_range_rect(this : Void*, range_rect : Pointer(Void)) : Void
  fun gtk_range_get_restrict_to_fill_level(this : Void*) : LibC::Int
  fun gtk_range_get_round_digits(this : Void*) : Int32
  fun gtk_range_get_show_fill_level(this : Void*) : LibC::Int
  fun gtk_range_get_slider_range(this : Void*, slider_start : Pointer(Int32), slider_end : Pointer(Int32)) : Void
  fun gtk_range_get_slider_size_fixed(this : Void*) : LibC::Int
  fun gtk_range_get_type : UInt64
  fun gtk_range_get_value(this : Void*) : Float64
  fun gtk_range_set_adjustment(this : Void*, adjustment : Pointer(Void)) : Void
  fun gtk_range_set_fill_level(this : Void*, fill_level : Float64) : Void
  fun gtk_range_set_flippable(this : Void*, flippable : LibC::Int) : Void
  fun gtk_range_set_increments(this : Void*, step : Float64, page : Float64) : Void
  fun gtk_range_set_inverted(this : Void*, setting : LibC::Int) : Void
  fun gtk_range_set_range(this : Void*, min : Float64, max : Float64) : Void
  fun gtk_range_set_restrict_to_fill_level(this : Void*, restrict_to_fill_level : LibC::Int) : Void
  fun gtk_range_set_round_digits(this : Void*, round_digits : Int32) : Void
  fun gtk_range_set_show_fill_level(this : Void*, show_fill_level : LibC::Int) : Void
  fun gtk_range_set_slider_size_fixed(this : Void*, size_fixed : LibC::Int) : Void
  fun gtk_range_set_value(this : Void*, value : Float64) : Void
  fun gtk_recent_info_create_app_info(this : Void*, app_name : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun gtk_recent_info_exists(this : Void*) : LibC::Int
  fun gtk_recent_info_get_added(this : Void*) : Pointer(Void)
  fun gtk_recent_info_get_age(this : Void*) : Int32
  fun gtk_recent_info_get_application_info(this : Void*, app_name : Pointer(LibC::Char), app_exec : Pointer(Pointer(LibC::Char)), count : Pointer(UInt32), stamp : Pointer(Pointer(Void))) : LibC::Int
  fun gtk_recent_info_get_applications(this : Void*, length : Pointer(UInt64)) : Pointer(Pointer(LibC::Char))
  fun gtk_recent_info_get_description(this : Void*) : Pointer(LibC::Char)
  fun gtk_recent_info_get_display_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_recent_info_get_gicon(this : Void*) : Pointer(Void)
  fun gtk_recent_info_get_groups(this : Void*, length : Pointer(UInt64)) : Pointer(Pointer(LibC::Char))
  fun gtk_recent_info_get_mime_type(this : Void*) : Pointer(LibC::Char)
  fun gtk_recent_info_get_modified(this : Void*) : Pointer(Void)
  fun gtk_recent_info_get_private_hint(this : Void*) : LibC::Int
  fun gtk_recent_info_get_short_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_recent_info_get_type : UInt64
  fun gtk_recent_info_get_uri(this : Void*) : Pointer(LibC::Char)
  fun gtk_recent_info_get_uri_display(this : Void*) : Pointer(LibC::Char)
  fun gtk_recent_info_get_visited(this : Void*) : Pointer(Void)
  fun gtk_recent_info_has_application(this : Void*, app_name : Pointer(LibC::Char)) : LibC::Int
  fun gtk_recent_info_has_group(this : Void*, group_name : Pointer(LibC::Char)) : LibC::Int
  fun gtk_recent_info_is_local(this : Void*) : LibC::Int
  fun gtk_recent_info_last_application(this : Void*) : Pointer(LibC::Char)
  fun gtk_recent_info_match(this : Void*, info_b : Pointer(Void)) : LibC::Int
  fun gtk_recent_info_ref(this : Void*) : Pointer(Void)
  fun gtk_recent_info_unref(this : Void*) : Void
  fun gtk_recent_manager_add_full(this : Void*, uri : Pointer(LibC::Char), recent_data : Pointer(Void)) : LibC::Int
  fun gtk_recent_manager_add_item(this : Void*, uri : Pointer(LibC::Char)) : LibC::Int
  fun gtk_recent_manager_error_quark : UInt32
  fun gtk_recent_manager_get_default : Pointer(Void)
  fun gtk_recent_manager_get_items(this : Void*) : Pointer(LibGLib::List)
  fun gtk_recent_manager_get_type : UInt64
  fun gtk_recent_manager_has_item(this : Void*, uri : Pointer(LibC::Char)) : LibC::Int
  fun gtk_recent_manager_lookup_item(this : Void*, uri : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun gtk_recent_manager_move_item(this : Void*, uri : Pointer(LibC::Char), new_uri : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun gtk_recent_manager_new : Pointer(Void)
  fun gtk_recent_manager_purge_items(this : Void*, error : LibGLib::Error**) : Int32
  fun gtk_recent_manager_remove_item(this : Void*, uri : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun gtk_render_activity(context : Pointer(Void), cr : Pointer(Void), x : Float64, y : Float64, width : Float64, height : Float64) : Void
  fun gtk_render_arrow(context : Pointer(Void), cr : Pointer(Void), angle : Float64, x : Float64, y : Float64, size : Float64) : Void
  fun gtk_render_background(context : Pointer(Void), cr : Pointer(Void), x : Float64, y : Float64, width : Float64, height : Float64) : Void
  fun gtk_render_check(context : Pointer(Void), cr : Pointer(Void), x : Float64, y : Float64, width : Float64, height : Float64) : Void
  fun gtk_render_expander(context : Pointer(Void), cr : Pointer(Void), x : Float64, y : Float64, width : Float64, height : Float64) : Void
  fun gtk_render_focus(context : Pointer(Void), cr : Pointer(Void), x : Float64, y : Float64, width : Float64, height : Float64) : Void
  fun gtk_render_frame(context : Pointer(Void), cr : Pointer(Void), x : Float64, y : Float64, width : Float64, height : Float64) : Void
  fun gtk_render_handle(context : Pointer(Void), cr : Pointer(Void), x : Float64, y : Float64, width : Float64, height : Float64) : Void
  fun gtk_render_icon(context : Pointer(Void), cr : Pointer(Void), texture : Pointer(Void), x : Float64, y : Float64) : Void
  fun gtk_render_layout(context : Pointer(Void), cr : Pointer(Void), x : Float64, y : Float64, layout : Pointer(Void)) : Void
  fun gtk_render_line(context : Pointer(Void), cr : Pointer(Void), x0 : Float64, y0 : Float64, x1 : Float64, y1 : Float64) : Void
  fun gtk_render_option(context : Pointer(Void), cr : Pointer(Void), x : Float64, y : Float64, width : Float64, height : Float64) : Void
  fun gtk_requisition_copy(this : Void*) : Pointer(Void)
  fun gtk_requisition_free(this : Void*) : Void
  fun gtk_requisition_get_type : UInt64
  fun gtk_requisition_new : Pointer(Void)
  fun gtk_revealer_get_child(this : Void*) : Pointer(Void)
  fun gtk_revealer_get_child_revealed(this : Void*) : LibC::Int
  fun gtk_revealer_get_reveal_child(this : Void*) : LibC::Int
  fun gtk_revealer_get_transition_duration(this : Void*) : UInt32
  fun gtk_revealer_get_transition_type(this : Void*) : UInt32
  fun gtk_revealer_get_type : UInt64
  fun gtk_revealer_new : Pointer(Void)
  fun gtk_revealer_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_revealer_set_reveal_child(this : Void*, reveal_child : LibC::Int) : Void
  fun gtk_revealer_set_transition_duration(this : Void*, duration : UInt32) : Void
  fun gtk_revealer_set_transition_type(this : Void*, transition : UInt32) : Void
  fun gtk_rgb_to_hsv(r : Float32, g : Float32, b : Float32, h : Pointer(Float32), s : Pointer(Float32), v : Pointer(Float32)) : Void
  fun gtk_root_get_display(this : Void*) : Pointer(Void)
  fun gtk_root_get_focus(this : Void*) : Pointer(Void)
  fun gtk_root_get_type : UInt64
  fun gtk_root_set_focus(this : Void*, focus : Pointer(Void)) : Void
  fun gtk_scale_add_mark(this : Void*, value : Float64, position : UInt32, markup : Pointer(LibC::Char)) : Void
  fun gtk_scale_button_get_adjustment(this : Void*) : Pointer(Void)
  fun gtk_scale_button_get_minus_button(this : Void*) : Pointer(Void)
  fun gtk_scale_button_get_plus_button(this : Void*) : Pointer(Void)
  fun gtk_scale_button_get_popup(this : Void*) : Pointer(Void)
  fun gtk_scale_button_get_type : UInt64
  fun gtk_scale_button_get_value(this : Void*) : Float64
  fun gtk_scale_button_new(min : Float64, max : Float64, step : Float64, icons : Pointer(Pointer(LibC::Char))) : Pointer(Void)
  fun gtk_scale_button_set_adjustment(this : Void*, adjustment : Pointer(Void)) : Void
  fun gtk_scale_button_set_icons(this : Void*, icons : Pointer(Pointer(LibC::Char))) : Void
  fun gtk_scale_button_set_value(this : Void*, value : Float64) : Void
  fun gtk_scale_clear_marks(this : Void*) : Void
  fun gtk_scale_get_digits(this : Void*) : Int32
  fun gtk_scale_get_draw_value(this : Void*) : LibC::Int
  fun gtk_scale_get_has_origin(this : Void*) : LibC::Int
  fun gtk_scale_get_layout(this : Void*) : Pointer(Void)
  fun gtk_scale_get_layout_offsets(this : Void*, x : Pointer(Int32), y : Pointer(Int32)) : Void
  fun gtk_scale_get_type : UInt64
  fun gtk_scale_get_value_pos(this : Void*) : UInt32
  fun gtk_scale_new(orientation : UInt32, adjustment : Pointer(Void)) : Pointer(Void)
  fun gtk_scale_new_with_range(orientation : UInt32, min : Float64, max : Float64, step : Float64) : Pointer(Void)
  fun gtk_scale_set_digits(this : Void*, digits : Int32) : Void
  fun gtk_scale_set_draw_value(this : Void*, draw_value : LibC::Int) : Void
  fun gtk_scale_set_format_value_func(this : Void*, func : ScaleFormatValueFunc, user_data : Pointer(Void), destroy_notify : LibGLib::DestroyNotify) : Void
  fun gtk_scale_set_has_origin(this : Void*, has_origin : LibC::Int) : Void
  fun gtk_scale_set_value_pos(this : Void*, pos : UInt32) : Void
  fun gtk_scrollable_get_border(this : Void*, border : Pointer(Void)) : LibC::Int
  fun gtk_scrollable_get_hadjustment(this : Void*) : Pointer(Void)
  fun gtk_scrollable_get_hscroll_policy(this : Void*) : UInt32
  fun gtk_scrollable_get_type : UInt64
  fun gtk_scrollable_get_vadjustment(this : Void*) : Pointer(Void)
  fun gtk_scrollable_get_vscroll_policy(this : Void*) : UInt32
  fun gtk_scrollable_set_hadjustment(this : Void*, hadjustment : Pointer(Void)) : Void
  fun gtk_scrollable_set_hscroll_policy(this : Void*, policy : UInt32) : Void
  fun gtk_scrollable_set_vadjustment(this : Void*, vadjustment : Pointer(Void)) : Void
  fun gtk_scrollable_set_vscroll_policy(this : Void*, policy : UInt32) : Void
  fun gtk_scrollbar_get_adjustment(this : Void*) : Pointer(Void)
  fun gtk_scrollbar_get_type : UInt64
  fun gtk_scrollbar_new(orientation : UInt32, adjustment : Pointer(Void)) : Pointer(Void)
  fun gtk_scrollbar_set_adjustment(this : Void*, adjustment : Pointer(Void)) : Void
  fun gtk_scrolled_window_get_child(this : Void*) : Pointer(Void)
  fun gtk_scrolled_window_get_hadjustment(this : Void*) : Pointer(Void)
  fun gtk_scrolled_window_get_has_frame(this : Void*) : LibC::Int
  fun gtk_scrolled_window_get_hscrollbar(this : Void*) : Pointer(Void)
  fun gtk_scrolled_window_get_kinetic_scrolling(this : Void*) : LibC::Int
  fun gtk_scrolled_window_get_max_content_height(this : Void*) : Int32
  fun gtk_scrolled_window_get_max_content_width(this : Void*) : Int32
  fun gtk_scrolled_window_get_min_content_height(this : Void*) : Int32
  fun gtk_scrolled_window_get_min_content_width(this : Void*) : Int32
  fun gtk_scrolled_window_get_overlay_scrolling(this : Void*) : LibC::Int
  fun gtk_scrolled_window_get_placement(this : Void*) : UInt32
  fun gtk_scrolled_window_get_policy(this : Void*, hscrollbar_policy : Pointer(UInt32), vscrollbar_policy : Pointer(UInt32)) : Void
  fun gtk_scrolled_window_get_propagate_natural_height(this : Void*) : LibC::Int
  fun gtk_scrolled_window_get_propagate_natural_width(this : Void*) : LibC::Int
  fun gtk_scrolled_window_get_type : UInt64
  fun gtk_scrolled_window_get_vadjustment(this : Void*) : Pointer(Void)
  fun gtk_scrolled_window_get_vscrollbar(this : Void*) : Pointer(Void)
  fun gtk_scrolled_window_new : Pointer(Void)
  fun gtk_scrolled_window_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_scrolled_window_set_hadjustment(this : Void*, hadjustment : Pointer(Void)) : Void
  fun gtk_scrolled_window_set_has_frame(this : Void*, has_frame : LibC::Int) : Void
  fun gtk_scrolled_window_set_kinetic_scrolling(this : Void*, kinetic_scrolling : LibC::Int) : Void
  fun gtk_scrolled_window_set_max_content_height(this : Void*, height : Int32) : Void
  fun gtk_scrolled_window_set_max_content_width(this : Void*, width : Int32) : Void
  fun gtk_scrolled_window_set_min_content_height(this : Void*, height : Int32) : Void
  fun gtk_scrolled_window_set_min_content_width(this : Void*, width : Int32) : Void
  fun gtk_scrolled_window_set_overlay_scrolling(this : Void*, overlay_scrolling : LibC::Int) : Void
  fun gtk_scrolled_window_set_placement(this : Void*, window_placement : UInt32) : Void
  fun gtk_scrolled_window_set_policy(this : Void*, hscrollbar_policy : UInt32, vscrollbar_policy : UInt32) : Void
  fun gtk_scrolled_window_set_propagate_natural_height(this : Void*, propagate : LibC::Int) : Void
  fun gtk_scrolled_window_set_propagate_natural_width(this : Void*, propagate : LibC::Int) : Void
  fun gtk_scrolled_window_set_vadjustment(this : Void*, vadjustment : Pointer(Void)) : Void
  fun gtk_scrolled_window_unset_placement(this : Void*) : Void
  fun gtk_search_bar_connect_entry(this : Void*, entry : Pointer(Void)) : Void
  fun gtk_search_bar_get_child(this : Void*) : Pointer(Void)
  fun gtk_search_bar_get_key_capture_widget(this : Void*) : Pointer(Void)
  fun gtk_search_bar_get_search_mode(this : Void*) : LibC::Int
  fun gtk_search_bar_get_show_close_button(this : Void*) : LibC::Int
  fun gtk_search_bar_get_type : UInt64
  fun gtk_search_bar_new : Pointer(Void)
  fun gtk_search_bar_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_search_bar_set_key_capture_widget(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_search_bar_set_search_mode(this : Void*, search_mode : LibC::Int) : Void
  fun gtk_search_bar_set_show_close_button(this : Void*, visible : LibC::Int) : Void
  fun gtk_search_entry_get_key_capture_widget(this : Void*) : Pointer(Void)
  fun gtk_search_entry_get_type : UInt64
  fun gtk_search_entry_new : Pointer(Void)
  fun gtk_search_entry_set_key_capture_widget(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_selection_filter_model_get_model(this : Void*) : Pointer(Void)
  fun gtk_selection_filter_model_get_type : UInt64
  fun gtk_selection_filter_model_new(model : Pointer(Void)) : Pointer(Void)
  fun gtk_selection_filter_model_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_selection_model_get_selection(this : Void*) : Pointer(Void)
  fun gtk_selection_model_get_selection_in_range(this : Void*, position : UInt32, n_items : UInt32) : Pointer(Void)
  fun gtk_selection_model_get_type : UInt64
  fun gtk_selection_model_is_selected(this : Void*, position : UInt32) : LibC::Int
  fun gtk_selection_model_select_all(this : Void*) : LibC::Int
  fun gtk_selection_model_select_item(this : Void*, position : UInt32, unselect_rest : LibC::Int) : LibC::Int
  fun gtk_selection_model_select_range(this : Void*, position : UInt32, n_items : UInt32, unselect_rest : LibC::Int) : LibC::Int
  fun gtk_selection_model_selection_changed(this : Void*, position : UInt32, n_items : UInt32) : Void
  fun gtk_selection_model_set_selection(this : Void*, selected : Pointer(Void), mask : Pointer(Void)) : LibC::Int
  fun gtk_selection_model_unselect_all(this : Void*) : LibC::Int
  fun gtk_selection_model_unselect_item(this : Void*, position : UInt32) : LibC::Int
  fun gtk_selection_model_unselect_range(this : Void*, position : UInt32, n_items : UInt32) : LibC::Int
  fun gtk_separator_get_type : UInt64
  fun gtk_separator_new(orientation : UInt32) : Pointer(Void)
  fun gtk_set_debug_flags(flags : UInt32) : Void
  fun gtk_settings_get_default : Pointer(Void)
  fun gtk_settings_get_for_display(display : Pointer(Void)) : Pointer(Void)
  fun gtk_settings_get_type : UInt64
  fun gtk_settings_reset_property(this : Void*, name : Pointer(LibC::Char)) : Void
  fun gtk_shortcut_action_activate(this : Void*, flags : UInt32, widget : Pointer(Void), args : Pointer(Void)) : LibC::Int
  fun gtk_shortcut_action_get_type : UInt64
  fun gtk_shortcut_action_parse_string(string : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_shortcut_action_print(this : Void*, string : Pointer(Void)) : Void
  fun gtk_shortcut_action_to_string(this : Void*) : Pointer(LibC::Char)
  fun gtk_shortcut_controller_add_shortcut(this : Void*, shortcut : Pointer(Void)) : Void
  fun gtk_shortcut_controller_get_mnemonics_modifiers(this : Void*) : UInt32
  fun gtk_shortcut_controller_get_scope(this : Void*) : UInt32
  fun gtk_shortcut_controller_get_type : UInt64
  fun gtk_shortcut_controller_new : Pointer(Void)
  fun gtk_shortcut_controller_new_for_model(model : Pointer(Void)) : Pointer(Void)
  fun gtk_shortcut_controller_remove_shortcut(this : Void*, shortcut : Pointer(Void)) : Void
  fun gtk_shortcut_controller_set_mnemonics_modifiers(this : Void*, modifiers : UInt32) : Void
  fun gtk_shortcut_controller_set_scope(this : Void*, scope : UInt32) : Void
  fun gtk_shortcut_get_action(this : Void*) : Pointer(Void)
  fun gtk_shortcut_get_arguments(this : Void*) : Pointer(Void)
  fun gtk_shortcut_get_trigger(this : Void*) : Pointer(Void)
  fun gtk_shortcut_get_type : UInt64
  fun gtk_shortcut_label_get_accelerator(this : Void*) : Pointer(LibC::Char)
  fun gtk_shortcut_label_get_disabled_text(this : Void*) : Pointer(LibC::Char)
  fun gtk_shortcut_label_get_type : UInt64
  fun gtk_shortcut_label_new(accelerator : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_shortcut_label_set_accelerator(this : Void*, accelerator : Pointer(LibC::Char)) : Void
  fun gtk_shortcut_label_set_disabled_text(this : Void*, disabled_text : Pointer(LibC::Char)) : Void
  fun gtk_shortcut_manager_get_type : UInt64
  fun gtk_shortcut_new(trigger : Pointer(Void), action : Pointer(Void)) : Pointer(Void)
  fun gtk_shortcut_set_action(this : Void*, action : Pointer(Void)) : Void
  fun gtk_shortcut_set_arguments(this : Void*, args : Pointer(Void)) : Void
  fun gtk_shortcut_set_trigger(this : Void*, trigger : Pointer(Void)) : Void
  fun gtk_shortcut_trigger_compare(this : Void*, trigger2 : Pointer(Void)) : Int32
  fun gtk_shortcut_trigger_equal(this : Void*, trigger2 : Pointer(Void)) : LibC::Int
  fun gtk_shortcut_trigger_get_type : UInt64
  fun gtk_shortcut_trigger_hash(this : Void*) : UInt32
  fun gtk_shortcut_trigger_parse_string(string : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_shortcut_trigger_print(this : Void*, string : Pointer(Void)) : Void
  fun gtk_shortcut_trigger_print_label(this : Void*, display : Pointer(Void), string : Pointer(Void)) : LibC::Int
  fun gtk_shortcut_trigger_to_label(this : Void*, display : Pointer(Void)) : Pointer(LibC::Char)
  fun gtk_shortcut_trigger_to_string(this : Void*) : Pointer(LibC::Char)
  fun gtk_shortcut_trigger_trigger(this : Void*, event : Pointer(Void), enable_mnemonics : LibC::Int) : UInt32
  fun gtk_shortcuts_group_get_type : UInt64
  fun gtk_shortcuts_section_get_type : UInt64
  fun gtk_shortcuts_shortcut_get_type : UInt64
  fun gtk_shortcuts_window_get_type : UInt64
  fun gtk_show_uri(parent : Pointer(Void), uri : Pointer(LibC::Char), timestamp : UInt32) : Void
  fun gtk_show_uri_full(parent : Pointer(Void), uri : Pointer(LibC::Char), timestamp : UInt32, cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gtk_show_uri_full_finish(parent : Pointer(Void), result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gtk_signal_action_get_signal_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_signal_action_get_type : UInt64
  fun gtk_signal_action_new(signal_name : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_signal_list_item_factory_get_type : UInt64
  fun gtk_signal_list_item_factory_new : Pointer(Void)
  fun gtk_single_selection_get_autoselect(this : Void*) : LibC::Int
  fun gtk_single_selection_get_can_unselect(this : Void*) : LibC::Int
  fun gtk_single_selection_get_model(this : Void*) : Pointer(Void)
  fun gtk_single_selection_get_selected(this : Void*) : UInt32
  fun gtk_single_selection_get_selected_item(this : Void*) : Pointer(Void)
  fun gtk_single_selection_get_type : UInt64
  fun gtk_single_selection_new(model : Pointer(Void)) : Pointer(Void)
  fun gtk_single_selection_set_autoselect(this : Void*, autoselect : LibC::Int) : Void
  fun gtk_single_selection_set_can_unselect(this : Void*, can_unselect : LibC::Int) : Void
  fun gtk_single_selection_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_single_selection_set_selected(this : Void*, position : UInt32) : Void
  fun gtk_size_group_add_widget(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_size_group_get_mode(this : Void*) : UInt32
  fun gtk_size_group_get_type : UInt64
  fun gtk_size_group_get_widgets(this : Void*) : Pointer(LibGLib::SList)
  fun gtk_size_group_new(mode : UInt32) : Pointer(Void)
  fun gtk_size_group_remove_widget(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_size_group_set_mode(this : Void*, mode : UInt32) : Void
  fun gtk_slice_list_model_get_model(this : Void*) : Pointer(Void)
  fun gtk_slice_list_model_get_offset(this : Void*) : UInt32
  fun gtk_slice_list_model_get_size(this : Void*) : UInt32
  fun gtk_slice_list_model_get_type : UInt64
  fun gtk_slice_list_model_new(model : Pointer(Void), offset : UInt32, size : UInt32) : Pointer(Void)
  fun gtk_slice_list_model_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_slice_list_model_set_offset(this : Void*, offset : UInt32) : Void
  fun gtk_slice_list_model_set_size(this : Void*, size : UInt32) : Void
  fun gtk_snapshot_append_border(this : Void*, outline : Pointer(Void), border_width : Pointer(Float32[4]), border_color : Pointer(Void[4])) : Void
  fun gtk_snapshot_append_cairo(this : Void*, bounds : Pointer(Void)) : Pointer(Void)
  fun gtk_snapshot_append_color(this : Void*, color : Pointer(Void), bounds : Pointer(Void)) : Void
  fun gtk_snapshot_append_conic_gradient(this : Void*, bounds : Pointer(Void), center : Pointer(Void), rotation : Float32, stops : Pointer(Void), n_stops : UInt64) : Void
  fun gtk_snapshot_append_inset_shadow(this : Void*, outline : Pointer(Void), color : Pointer(Void), dx : Float32, dy : Float32, spread : Float32, blur_radius : Float32) : Void
  fun gtk_snapshot_append_layout(this : Void*, layout : Pointer(Void), color : Pointer(Void)) : Void
  fun gtk_snapshot_append_linear_gradient(this : Void*, bounds : Pointer(Void), start_point : Pointer(Void), end_point : Pointer(Void), stops : Pointer(Void), n_stops : UInt64) : Void
  fun gtk_snapshot_append_node(this : Void*, node : Pointer(Void)) : Void
  fun gtk_snapshot_append_outset_shadow(this : Void*, outline : Pointer(Void), color : Pointer(Void), dx : Float32, dy : Float32, spread : Float32, blur_radius : Float32) : Void
  fun gtk_snapshot_append_radial_gradient(this : Void*, bounds : Pointer(Void), center : Pointer(Void), hradius : Float32, vradius : Float32, start : Float32, _end : Float32, stops : Pointer(Void), n_stops : UInt64) : Void
  fun gtk_snapshot_append_repeating_linear_gradient(this : Void*, bounds : Pointer(Void), start_point : Pointer(Void), end_point : Pointer(Void), stops : Pointer(Void), n_stops : UInt64) : Void
  fun gtk_snapshot_append_repeating_radial_gradient(this : Void*, bounds : Pointer(Void), center : Pointer(Void), hradius : Float32, vradius : Float32, start : Float32, _end : Float32, stops : Pointer(Void), n_stops : UInt64) : Void
  fun gtk_snapshot_append_texture(this : Void*, texture : Pointer(Void), bounds : Pointer(Void)) : Void
  fun gtk_snapshot_get_type : UInt64
  fun gtk_snapshot_gl_shader_pop_texture(this : Void*) : Void
  fun gtk_snapshot_new : Pointer(Void)
  fun gtk_snapshot_perspective(this : Void*, depth : Float32) : Void
  fun gtk_snapshot_pop(this : Void*) : Void
  fun gtk_snapshot_push_blend(this : Void*, blend_mode : UInt32) : Void
  fun gtk_snapshot_push_blur(this : Void*, radius : Float64) : Void
  fun gtk_snapshot_push_clip(this : Void*, bounds : Pointer(Void)) : Void
  fun gtk_snapshot_push_color_matrix(this : Void*, color_matrix : Pointer(Void), color_offset : Pointer(Void)) : Void
  fun gtk_snapshot_push_cross_fade(this : Void*, progress : Float64) : Void
  fun gtk_snapshot_push_gl_shader(this : Void*, shader : Pointer(Void), bounds : Pointer(Void), take_args : Pointer(Void)) : Void
  fun gtk_snapshot_push_opacity(this : Void*, opacity : Float64) : Void
  fun gtk_snapshot_push_repeat(this : Void*, bounds : Pointer(Void), child_bounds : Pointer(Void)) : Void
  fun gtk_snapshot_push_rounded_clip(this : Void*, bounds : Pointer(Void)) : Void
  fun gtk_snapshot_push_shadow(this : Void*, shadow : Pointer(Void), n_shadows : UInt64) : Void
  fun gtk_snapshot_render_background(this : Void*, context : Pointer(Void), x : Float64, y : Float64, width : Float64, height : Float64) : Void
  fun gtk_snapshot_render_focus(this : Void*, context : Pointer(Void), x : Float64, y : Float64, width : Float64, height : Float64) : Void
  fun gtk_snapshot_render_frame(this : Void*, context : Pointer(Void), x : Float64, y : Float64, width : Float64, height : Float64) : Void
  fun gtk_snapshot_render_insertion_cursor(this : Void*, context : Pointer(Void), x : Float64, y : Float64, layout : Pointer(Void), index : Int32, direction : UInt32) : Void
  fun gtk_snapshot_render_layout(this : Void*, context : Pointer(Void), x : Float64, y : Float64, layout : Pointer(Void)) : Void
  fun gtk_snapshot_restore(this : Void*) : Void
  fun gtk_snapshot_rotate(this : Void*, angle : Float32) : Void
  fun gtk_snapshot_rotate_3d(this : Void*, angle : Float32, axis : Pointer(Void)) : Void
  fun gtk_snapshot_save(this : Void*) : Void
  fun gtk_snapshot_scale(this : Void*, factor_x : Float32, factor_y : Float32) : Void
  fun gtk_snapshot_scale_3d(this : Void*, factor_x : Float32, factor_y : Float32, factor_z : Float32) : Void
  fun gtk_snapshot_to_node(this : Void*) : Pointer(Void)
  fun gtk_snapshot_to_paintable(this : Void*, size : Pointer(Void)) : Pointer(Void)
  fun gtk_snapshot_transform(this : Void*, transform : Pointer(Void)) : Void
  fun gtk_snapshot_transform_matrix(this : Void*, matrix : Pointer(Void)) : Void
  fun gtk_snapshot_translate(this : Void*, point : Pointer(Void)) : Void
  fun gtk_snapshot_translate_3d(this : Void*, point : Pointer(Void)) : Void
  fun gtk_sort_list_model_get_incremental(this : Void*) : LibC::Int
  fun gtk_sort_list_model_get_model(this : Void*) : Pointer(Void)
  fun gtk_sort_list_model_get_pending(this : Void*) : UInt32
  fun gtk_sort_list_model_get_sorter(this : Void*) : Pointer(Void)
  fun gtk_sort_list_model_get_type : UInt64
  fun gtk_sort_list_model_new(model : Pointer(Void), sorter : Pointer(Void)) : Pointer(Void)
  fun gtk_sort_list_model_set_incremental(this : Void*, incremental : LibC::Int) : Void
  fun gtk_sort_list_model_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_sort_list_model_set_sorter(this : Void*, sorter : Pointer(Void)) : Void
  fun gtk_sorter_changed(this : Void*, change : UInt32) : Void
  fun gtk_sorter_compare(this : Void*, item1 : Pointer(Void), item2 : Pointer(Void)) : Int32
  fun gtk_sorter_get_order(this : Void*) : UInt32
  fun gtk_sorter_get_type : UInt64
  fun gtk_spin_button_configure(this : Void*, adjustment : Pointer(Void), climb_rate : Float64, digits : UInt32) : Void
  fun gtk_spin_button_get_adjustment(this : Void*) : Pointer(Void)
  fun gtk_spin_button_get_climb_rate(this : Void*) : Float64
  fun gtk_spin_button_get_digits(this : Void*) : UInt32
  fun gtk_spin_button_get_increments(this : Void*, step : Pointer(Float64), page : Pointer(Float64)) : Void
  fun gtk_spin_button_get_numeric(this : Void*) : LibC::Int
  fun gtk_spin_button_get_range(this : Void*, min : Pointer(Float64), max : Pointer(Float64)) : Void
  fun gtk_spin_button_get_snap_to_ticks(this : Void*) : LibC::Int
  fun gtk_spin_button_get_type : UInt64
  fun gtk_spin_button_get_update_policy(this : Void*) : UInt32
  fun gtk_spin_button_get_value(this : Void*) : Float64
  fun gtk_spin_button_get_value_as_int(this : Void*) : Int32
  fun gtk_spin_button_get_wrap(this : Void*) : LibC::Int
  fun gtk_spin_button_new(adjustment : Pointer(Void), climb_rate : Float64, digits : UInt32) : Pointer(Void)
  fun gtk_spin_button_new_with_range(min : Float64, max : Float64, step : Float64) : Pointer(Void)
  fun gtk_spin_button_set_adjustment(this : Void*, adjustment : Pointer(Void)) : Void
  fun gtk_spin_button_set_climb_rate(this : Void*, climb_rate : Float64) : Void
  fun gtk_spin_button_set_digits(this : Void*, digits : UInt32) : Void
  fun gtk_spin_button_set_increments(this : Void*, step : Float64, page : Float64) : Void
  fun gtk_spin_button_set_numeric(this : Void*, numeric : LibC::Int) : Void
  fun gtk_spin_button_set_range(this : Void*, min : Float64, max : Float64) : Void
  fun gtk_spin_button_set_snap_to_ticks(this : Void*, snap_to_ticks : LibC::Int) : Void
  fun gtk_spin_button_set_update_policy(this : Void*, policy : UInt32) : Void
  fun gtk_spin_button_set_value(this : Void*, value : Float64) : Void
  fun gtk_spin_button_set_wrap(this : Void*, wrap : LibC::Int) : Void
  fun gtk_spin_button_spin(this : Void*, direction : UInt32, increment : Float64) : Void
  fun gtk_spin_button_update(this : Void*) : Void
  fun gtk_spinner_get_spinning(this : Void*) : LibC::Int
  fun gtk_spinner_get_type : UInt64
  fun gtk_spinner_new : Pointer(Void)
  fun gtk_spinner_set_spinning(this : Void*, spinning : LibC::Int) : Void
  fun gtk_spinner_start(this : Void*) : Void
  fun gtk_spinner_stop(this : Void*) : Void
  fun gtk_stack_add_child(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun gtk_stack_add_named(this : Void*, child : Pointer(Void), name : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_stack_add_titled(this : Void*, child : Pointer(Void), name : Pointer(LibC::Char), title : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_stack_get_child_by_name(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_stack_get_hhomogeneous(this : Void*) : LibC::Int
  fun gtk_stack_get_interpolate_size(this : Void*) : LibC::Int
  fun gtk_stack_get_page(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun gtk_stack_get_pages(this : Void*) : Pointer(Void)
  fun gtk_stack_get_transition_duration(this : Void*) : UInt32
  fun gtk_stack_get_transition_running(this : Void*) : LibC::Int
  fun gtk_stack_get_transition_type(this : Void*) : UInt32
  fun gtk_stack_get_type : UInt64
  fun gtk_stack_get_vhomogeneous(this : Void*) : LibC::Int
  fun gtk_stack_get_visible_child(this : Void*) : Pointer(Void)
  fun gtk_stack_get_visible_child_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_stack_new : Pointer(Void)
  fun gtk_stack_page_get_child(this : Void*) : Pointer(Void)
  fun gtk_stack_page_get_icon_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_stack_page_get_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_stack_page_get_needs_attention(this : Void*) : LibC::Int
  fun gtk_stack_page_get_title(this : Void*) : Pointer(LibC::Char)
  fun gtk_stack_page_get_type : UInt64
  fun gtk_stack_page_get_use_underline(this : Void*) : LibC::Int
  fun gtk_stack_page_get_visible(this : Void*) : LibC::Int
  fun gtk_stack_page_set_icon_name(this : Void*, setting : Pointer(LibC::Char)) : Void
  fun gtk_stack_page_set_name(this : Void*, setting : Pointer(LibC::Char)) : Void
  fun gtk_stack_page_set_needs_attention(this : Void*, setting : LibC::Int) : Void
  fun gtk_stack_page_set_title(this : Void*, setting : Pointer(LibC::Char)) : Void
  fun gtk_stack_page_set_use_underline(this : Void*, setting : LibC::Int) : Void
  fun gtk_stack_page_set_visible(this : Void*, visible : LibC::Int) : Void
  fun gtk_stack_remove(this : Void*, child : Pointer(Void)) : Void
  fun gtk_stack_set_hhomogeneous(this : Void*, hhomogeneous : LibC::Int) : Void
  fun gtk_stack_set_interpolate_size(this : Void*, interpolate_size : LibC::Int) : Void
  fun gtk_stack_set_transition_duration(this : Void*, duration : UInt32) : Void
  fun gtk_stack_set_transition_type(this : Void*, transition : UInt32) : Void
  fun gtk_stack_set_vhomogeneous(this : Void*, vhomogeneous : LibC::Int) : Void
  fun gtk_stack_set_visible_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_stack_set_visible_child_full(this : Void*, name : Pointer(LibC::Char), transition : UInt32) : Void
  fun gtk_stack_set_visible_child_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun gtk_stack_sidebar_get_stack(this : Void*) : Pointer(Void)
  fun gtk_stack_sidebar_get_type : UInt64
  fun gtk_stack_sidebar_new : Pointer(Void)
  fun gtk_stack_sidebar_set_stack(this : Void*, stack : Pointer(Void)) : Void
  fun gtk_stack_switcher_get_stack(this : Void*) : Pointer(Void)
  fun gtk_stack_switcher_get_type : UInt64
  fun gtk_stack_switcher_new : Pointer(Void)
  fun gtk_stack_switcher_set_stack(this : Void*, stack : Pointer(Void)) : Void
  fun gtk_statusbar_get_context_id(this : Void*, context_description : Pointer(LibC::Char)) : UInt32
  fun gtk_statusbar_get_type : UInt64
  fun gtk_statusbar_new : Pointer(Void)
  fun gtk_statusbar_pop(this : Void*, context_id : UInt32) : Void
  fun gtk_statusbar_push(this : Void*, context_id : UInt32, text : Pointer(LibC::Char)) : UInt32
  fun gtk_statusbar_remove(this : Void*, context_id : UInt32, message_id : UInt32) : Void
  fun gtk_statusbar_remove_all(this : Void*, context_id : UInt32) : Void
  fun gtk_string_filter_get_expression(this : Void*) : Pointer(Void)
  fun gtk_string_filter_get_ignore_case(this : Void*) : LibC::Int
  fun gtk_string_filter_get_match_mode(this : Void*) : UInt32
  fun gtk_string_filter_get_search(this : Void*) : Pointer(LibC::Char)
  fun gtk_string_filter_get_type : UInt64
  fun gtk_string_filter_new(expression : Pointer(Void)) : Pointer(Void)
  fun gtk_string_filter_set_expression(this : Void*, expression : Pointer(Void)) : Void
  fun gtk_string_filter_set_ignore_case(this : Void*, ignore_case : LibC::Int) : Void
  fun gtk_string_filter_set_match_mode(this : Void*, mode : UInt32) : Void
  fun gtk_string_filter_set_search(this : Void*, search : Pointer(LibC::Char)) : Void
  fun gtk_string_list_append(this : Void*, string : Pointer(LibC::Char)) : Void
  fun gtk_string_list_get_string(this : Void*, position : UInt32) : Pointer(LibC::Char)
  fun gtk_string_list_get_type : UInt64
  fun gtk_string_list_new(strings : Pointer(Pointer(LibC::Char))) : Pointer(Void)
  fun gtk_string_list_remove(this : Void*, position : UInt32) : Void
  fun gtk_string_list_splice(this : Void*, position : UInt32, n_removals : UInt32, additions : Pointer(Pointer(LibC::Char))) : Void
  fun gtk_string_list_take(this : Void*, string : Pointer(LibC::Char)) : Void
  fun gtk_string_object_get_string(this : Void*) : Pointer(LibC::Char)
  fun gtk_string_object_get_type : UInt64
  fun gtk_string_object_new(string : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_string_sorter_get_expression(this : Void*) : Pointer(Void)
  fun gtk_string_sorter_get_ignore_case(this : Void*) : LibC::Int
  fun gtk_string_sorter_get_type : UInt64
  fun gtk_string_sorter_new(expression : Pointer(Void)) : Pointer(Void)
  fun gtk_string_sorter_set_expression(this : Void*, expression : Pointer(Void)) : Void
  fun gtk_string_sorter_set_ignore_case(this : Void*, ignore_case : LibC::Int) : Void
  fun gtk_style_context_add_class(this : Void*, class_name : Pointer(LibC::Char)) : Void
  fun gtk_style_context_add_provider(this : Void*, provider : Pointer(Void), priority : UInt32) : Void
  fun gtk_style_context_add_provider_for_display(display : Pointer(Void), provider : Pointer(Void), priority : UInt32) : Void
  fun gtk_style_context_get_border(this : Void*, border : Pointer(Void)) : Void
  fun gtk_style_context_get_color(this : Void*, color : Pointer(Void)) : Void
  fun gtk_style_context_get_display(this : Void*) : Pointer(Void)
  fun gtk_style_context_get_margin(this : Void*, margin : Pointer(Void)) : Void
  fun gtk_style_context_get_padding(this : Void*, padding : Pointer(Void)) : Void
  fun gtk_style_context_get_scale(this : Void*) : Int32
  fun gtk_style_context_get_state(this : Void*) : UInt32
  fun gtk_style_context_get_type : UInt64
  fun gtk_style_context_has_class(this : Void*, class_name : Pointer(LibC::Char)) : LibC::Int
  fun gtk_style_context_lookup_color(this : Void*, color_name : Pointer(LibC::Char), color : Pointer(Void)) : LibC::Int
  fun gtk_style_context_remove_class(this : Void*, class_name : Pointer(LibC::Char)) : Void
  fun gtk_style_context_remove_provider(this : Void*, provider : Pointer(Void)) : Void
  fun gtk_style_context_remove_provider_for_display(display : Pointer(Void), provider : Pointer(Void)) : Void
  fun gtk_style_context_restore(this : Void*) : Void
  fun gtk_style_context_save(this : Void*) : Void
  fun gtk_style_context_set_display(this : Void*, display : Pointer(Void)) : Void
  fun gtk_style_context_set_scale(this : Void*, scale : Int32) : Void
  fun gtk_style_context_set_state(this : Void*, flags : UInt32) : Void
  fun gtk_style_context_to_string(this : Void*, flags : UInt32) : Pointer(LibC::Char)
  fun gtk_style_provider_get_type : UInt64
  fun gtk_switch_get_active(this : Void*) : LibC::Int
  fun gtk_switch_get_state(this : Void*) : LibC::Int
  fun gtk_switch_get_type : UInt64
  fun gtk_switch_new : Pointer(Void)
  fun gtk_switch_set_active(this : Void*, is_active : LibC::Int) : Void
  fun gtk_switch_set_state(this : Void*, state : LibC::Int) : Void
  fun gtk_test_accessible_assertion_message_role(domain : Pointer(LibC::Char), file : Pointer(LibC::Char), line : Int32, func : Pointer(LibC::Char), expr : Pointer(LibC::Char), accessible : Pointer(Void), expected_role : UInt32, actual_role : UInt32) : Void
  fun gtk_test_accessible_has_property(accessible : Pointer(Void), property : UInt32) : LibC::Int
  fun gtk_test_accessible_has_relation(accessible : Pointer(Void), relation : UInt32) : LibC::Int
  fun gtk_test_accessible_has_role(accessible : Pointer(Void), role : UInt32) : LibC::Int
  fun gtk_test_accessible_has_state(accessible : Pointer(Void), state : UInt32) : LibC::Int
  fun gtk_test_list_all_types(n_types : Pointer(UInt32)) : Pointer(UInt64)
  fun gtk_test_register_all_types : Void
  fun gtk_test_widget_wait_for_draw(widget : Pointer(Void)) : Void
  fun gtk_text_buffer_add_mark(this : Void*, mark : Pointer(Void), where : Pointer(Void)) : Void
  fun gtk_text_buffer_add_selection_clipboard(this : Void*, clipboard : Pointer(Void)) : Void
  fun gtk_text_buffer_apply_tag(this : Void*, tag : Pointer(Void), start : Pointer(Void), _end : Pointer(Void)) : Void
  fun gtk_text_buffer_apply_tag_by_name(this : Void*, name : Pointer(LibC::Char), start : Pointer(Void), _end : Pointer(Void)) : Void
  fun gtk_text_buffer_backspace(this : Void*, iter : Pointer(Void), interactive : LibC::Int, default_editable : LibC::Int) : LibC::Int
  fun gtk_text_buffer_begin_irreversible_action(this : Void*) : Void
  fun gtk_text_buffer_begin_user_action(this : Void*) : Void
  fun gtk_text_buffer_copy_clipboard(this : Void*, clipboard : Pointer(Void)) : Void
  fun gtk_text_buffer_create_child_anchor(this : Void*, iter : Pointer(Void)) : Pointer(Void)
  fun gtk_text_buffer_create_mark(this : Void*, mark_name : Pointer(LibC::Char), where : Pointer(Void), left_gravity : LibC::Int) : Pointer(Void)
  fun gtk_text_buffer_cut_clipboard(this : Void*, clipboard : Pointer(Void), default_editable : LibC::Int) : Void
  fun gtk_text_buffer_delete(this : Void*, start : Pointer(Void), _end : Pointer(Void)) : Void
  fun gtk_text_buffer_delete_interactive(this : Void*, start_iter : Pointer(Void), end_iter : Pointer(Void), default_editable : LibC::Int) : LibC::Int
  fun gtk_text_buffer_delete_mark(this : Void*, mark : Pointer(Void)) : Void
  fun gtk_text_buffer_delete_mark_by_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun gtk_text_buffer_delete_selection(this : Void*, interactive : LibC::Int, default_editable : LibC::Int) : LibC::Int
  fun gtk_text_buffer_end_irreversible_action(this : Void*) : Void
  fun gtk_text_buffer_end_user_action(this : Void*) : Void
  fun gtk_text_buffer_get_bounds(this : Void*, start : Pointer(Void), _end : Pointer(Void)) : Void
  fun gtk_text_buffer_get_can_redo(this : Void*) : LibC::Int
  fun gtk_text_buffer_get_can_undo(this : Void*) : LibC::Int
  fun gtk_text_buffer_get_char_count(this : Void*) : Int32
  fun gtk_text_buffer_get_enable_undo(this : Void*) : LibC::Int
  fun gtk_text_buffer_get_end_iter(this : Void*, iter : Pointer(Void)) : Void
  fun gtk_text_buffer_get_has_selection(this : Void*) : LibC::Int
  fun gtk_text_buffer_get_insert(this : Void*) : Pointer(Void)
  fun gtk_text_buffer_get_iter_at_child_anchor(this : Void*, iter : Pointer(Void), anchor : Pointer(Void)) : Void
  fun gtk_text_buffer_get_iter_at_line(this : Void*, iter : Pointer(Void), line_number : Int32) : LibC::Int
  fun gtk_text_buffer_get_iter_at_line_index(this : Void*, iter : Pointer(Void), line_number : Int32, byte_index : Int32) : LibC::Int
  fun gtk_text_buffer_get_iter_at_line_offset(this : Void*, iter : Pointer(Void), line_number : Int32, char_offset : Int32) : LibC::Int
  fun gtk_text_buffer_get_iter_at_mark(this : Void*, iter : Pointer(Void), mark : Pointer(Void)) : Void
  fun gtk_text_buffer_get_iter_at_offset(this : Void*, iter : Pointer(Void), char_offset : Int32) : Void
  fun gtk_text_buffer_get_line_count(this : Void*) : Int32
  fun gtk_text_buffer_get_mark(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_text_buffer_get_max_undo_levels(this : Void*) : UInt32
  fun gtk_text_buffer_get_modified(this : Void*) : LibC::Int
  fun gtk_text_buffer_get_selection_bound(this : Void*) : Pointer(Void)
  fun gtk_text_buffer_get_selection_bounds(this : Void*, start : Pointer(Void), _end : Pointer(Void)) : LibC::Int
  fun gtk_text_buffer_get_selection_content(this : Void*) : Pointer(Void)
  fun gtk_text_buffer_get_slice(this : Void*, start : Pointer(Void), _end : Pointer(Void), include_hidden_chars : LibC::Int) : Pointer(LibC::Char)
  fun gtk_text_buffer_get_start_iter(this : Void*, iter : Pointer(Void)) : Void
  fun gtk_text_buffer_get_tag_table(this : Void*) : Pointer(Void)
  fun gtk_text_buffer_get_text(this : Void*, start : Pointer(Void), _end : Pointer(Void), include_hidden_chars : LibC::Int) : Pointer(LibC::Char)
  fun gtk_text_buffer_get_type : UInt64
  fun gtk_text_buffer_insert(this : Void*, iter : Pointer(Void), text : Pointer(LibC::Char), len : Int32) : Void
  fun gtk_text_buffer_insert_at_cursor(this : Void*, text : Pointer(LibC::Char), len : Int32) : Void
  fun gtk_text_buffer_insert_child_anchor(this : Void*, iter : Pointer(Void), anchor : Pointer(Void)) : Void
  fun gtk_text_buffer_insert_interactive(this : Void*, iter : Pointer(Void), text : Pointer(LibC::Char), len : Int32, default_editable : LibC::Int) : LibC::Int
  fun gtk_text_buffer_insert_interactive_at_cursor(this : Void*, text : Pointer(LibC::Char), len : Int32, default_editable : LibC::Int) : LibC::Int
  fun gtk_text_buffer_insert_markup(this : Void*, iter : Pointer(Void), markup : Pointer(LibC::Char), len : Int32) : Void
  fun gtk_text_buffer_insert_paintable(this : Void*, iter : Pointer(Void), paintable : Pointer(Void)) : Void
  fun gtk_text_buffer_insert_range(this : Void*, iter : Pointer(Void), start : Pointer(Void), _end : Pointer(Void)) : Void
  fun gtk_text_buffer_insert_range_interactive(this : Void*, iter : Pointer(Void), start : Pointer(Void), _end : Pointer(Void), default_editable : LibC::Int) : LibC::Int
  fun gtk_text_buffer_move_mark(this : Void*, mark : Pointer(Void), where : Pointer(Void)) : Void
  fun gtk_text_buffer_move_mark_by_name(this : Void*, name : Pointer(LibC::Char), where : Pointer(Void)) : Void
  fun gtk_text_buffer_new(table : Pointer(Void)) : Pointer(Void)
  fun gtk_text_buffer_paste_clipboard(this : Void*, clipboard : Pointer(Void), override_location : Pointer(Void), default_editable : LibC::Int) : Void
  fun gtk_text_buffer_place_cursor(this : Void*, where : Pointer(Void)) : Void
  fun gtk_text_buffer_redo(this : Void*) : Void
  fun gtk_text_buffer_remove_all_tags(this : Void*, start : Pointer(Void), _end : Pointer(Void)) : Void
  fun gtk_text_buffer_remove_selection_clipboard(this : Void*, clipboard : Pointer(Void)) : Void
  fun gtk_text_buffer_remove_tag(this : Void*, tag : Pointer(Void), start : Pointer(Void), _end : Pointer(Void)) : Void
  fun gtk_text_buffer_remove_tag_by_name(this : Void*, name : Pointer(LibC::Char), start : Pointer(Void), _end : Pointer(Void)) : Void
  fun gtk_text_buffer_select_range(this : Void*, ins : Pointer(Void), bound : Pointer(Void)) : Void
  fun gtk_text_buffer_set_enable_undo(this : Void*, enable_undo : LibC::Int) : Void
  fun gtk_text_buffer_set_max_undo_levels(this : Void*, max_undo_levels : UInt32) : Void
  fun gtk_text_buffer_set_modified(this : Void*, setting : LibC::Int) : Void
  fun gtk_text_buffer_set_text(this : Void*, text : Pointer(LibC::Char), len : Int32) : Void
  fun gtk_text_buffer_undo(this : Void*) : Void
  fun gtk_text_child_anchor_get_deleted(this : Void*) : LibC::Int
  fun gtk_text_child_anchor_get_type : UInt64
  fun gtk_text_child_anchor_get_widgets(this : Void*, out_len : Pointer(UInt32)) : Pointer(Pointer(Void))
  fun gtk_text_child_anchor_new : Pointer(Void)
  fun gtk_text_compute_cursor_extents(this : Void*, position : UInt64, strong : Pointer(Void), weak : Pointer(Void)) : Void
  fun gtk_text_get_activates_default(this : Void*) : LibC::Int
  fun gtk_text_get_attributes(this : Void*) : Pointer(Void)
  fun gtk_text_get_buffer(this : Void*) : Pointer(Void)
  fun gtk_text_get_enable_emoji_completion(this : Void*) : LibC::Int
  fun gtk_text_get_extra_menu(this : Void*) : Pointer(Void)
  fun gtk_text_get_input_hints(this : Void*) : UInt32
  fun gtk_text_get_input_purpose(this : Void*) : UInt32
  fun gtk_text_get_invisible_char(this : Void*) : UInt32
  fun gtk_text_get_max_length(this : Void*) : Int32
  fun gtk_text_get_overwrite_mode(this : Void*) : LibC::Int
  fun gtk_text_get_placeholder_text(this : Void*) : Pointer(LibC::Char)
  fun gtk_text_get_propagate_text_width(this : Void*) : LibC::Int
  fun gtk_text_get_tabs(this : Void*) : Pointer(Void)
  fun gtk_text_get_text_length(this : Void*) : UInt16
  fun gtk_text_get_truncate_multiline(this : Void*) : LibC::Int
  fun gtk_text_get_type : UInt64
  fun gtk_text_get_visibility(this : Void*) : LibC::Int
  fun gtk_text_grab_focus_without_selecting(this : Void*) : LibC::Int
  fun gtk_text_iter_assign(this : Void*, other : Pointer(Void)) : Void
  fun gtk_text_iter_backward_char(this : Void*) : LibC::Int
  fun gtk_text_iter_backward_chars(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_backward_cursor_position(this : Void*) : LibC::Int
  fun gtk_text_iter_backward_cursor_positions(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_backward_find_char(this : Void*, pred : TextCharPredicate, user_data : Pointer(Void), limit : Pointer(Void)) : LibC::Int
  fun gtk_text_iter_backward_line(this : Void*) : LibC::Int
  fun gtk_text_iter_backward_lines(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_backward_search(this : Void*, str : Pointer(LibC::Char), flags : UInt32, match_start : Pointer(Void), match_end : Pointer(Void), limit : Pointer(Void)) : LibC::Int
  fun gtk_text_iter_backward_sentence_start(this : Void*) : LibC::Int
  fun gtk_text_iter_backward_sentence_starts(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_backward_to_tag_toggle(this : Void*, tag : Pointer(Void)) : LibC::Int
  fun gtk_text_iter_backward_visible_cursor_position(this : Void*) : LibC::Int
  fun gtk_text_iter_backward_visible_cursor_positions(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_backward_visible_line(this : Void*) : LibC::Int
  fun gtk_text_iter_backward_visible_lines(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_backward_visible_word_start(this : Void*) : LibC::Int
  fun gtk_text_iter_backward_visible_word_starts(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_backward_word_start(this : Void*) : LibC::Int
  fun gtk_text_iter_backward_word_starts(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_can_insert(this : Void*, default_editability : LibC::Int) : LibC::Int
  fun gtk_text_iter_compare(this : Void*, rhs : Pointer(Void)) : Int32
  fun gtk_text_iter_copy(this : Void*) : Pointer(Void)
  fun gtk_text_iter_editable(this : Void*, default_setting : LibC::Int) : LibC::Int
  fun gtk_text_iter_ends_line(this : Void*) : LibC::Int
  fun gtk_text_iter_ends_sentence(this : Void*) : LibC::Int
  fun gtk_text_iter_ends_tag(this : Void*, tag : Pointer(Void)) : LibC::Int
  fun gtk_text_iter_ends_word(this : Void*) : LibC::Int
  fun gtk_text_iter_equal(this : Void*, rhs : Pointer(Void)) : LibC::Int
  fun gtk_text_iter_forward_char(this : Void*) : LibC::Int
  fun gtk_text_iter_forward_chars(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_forward_cursor_position(this : Void*) : LibC::Int
  fun gtk_text_iter_forward_cursor_positions(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_forward_find_char(this : Void*, pred : TextCharPredicate, user_data : Pointer(Void), limit : Pointer(Void)) : LibC::Int
  fun gtk_text_iter_forward_line(this : Void*) : LibC::Int
  fun gtk_text_iter_forward_lines(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_forward_search(this : Void*, str : Pointer(LibC::Char), flags : UInt32, match_start : Pointer(Void), match_end : Pointer(Void), limit : Pointer(Void)) : LibC::Int
  fun gtk_text_iter_forward_sentence_end(this : Void*) : LibC::Int
  fun gtk_text_iter_forward_sentence_ends(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_forward_to_end(this : Void*) : Void
  fun gtk_text_iter_forward_to_line_end(this : Void*) : LibC::Int
  fun gtk_text_iter_forward_to_tag_toggle(this : Void*, tag : Pointer(Void)) : LibC::Int
  fun gtk_text_iter_forward_visible_cursor_position(this : Void*) : LibC::Int
  fun gtk_text_iter_forward_visible_cursor_positions(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_forward_visible_line(this : Void*) : LibC::Int
  fun gtk_text_iter_forward_visible_lines(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_forward_visible_word_end(this : Void*) : LibC::Int
  fun gtk_text_iter_forward_visible_word_ends(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_forward_word_end(this : Void*) : LibC::Int
  fun gtk_text_iter_forward_word_ends(this : Void*, count : Int32) : LibC::Int
  fun gtk_text_iter_free(this : Void*) : Void
  fun gtk_text_iter_get_buffer(this : Void*) : Pointer(Void)
  fun gtk_text_iter_get_bytes_in_line(this : Void*) : Int32
  fun gtk_text_iter_get_char(this : Void*) : UInt32
  fun gtk_text_iter_get_chars_in_line(this : Void*) : Int32
  fun gtk_text_iter_get_child_anchor(this : Void*) : Pointer(Void)
  fun gtk_text_iter_get_language(this : Void*) : Pointer(Void)
  fun gtk_text_iter_get_line(this : Void*) : Int32
  fun gtk_text_iter_get_line_index(this : Void*) : Int32
  fun gtk_text_iter_get_line_offset(this : Void*) : Int32
  fun gtk_text_iter_get_marks(this : Void*) : Pointer(LibGLib::SList)
  fun gtk_text_iter_get_offset(this : Void*) : Int32
  fun gtk_text_iter_get_paintable(this : Void*) : Pointer(Void)
  fun gtk_text_iter_get_slice(this : Void*, _end : Pointer(Void)) : Pointer(LibC::Char)
  fun gtk_text_iter_get_tags(this : Void*) : Pointer(LibGLib::SList)
  fun gtk_text_iter_get_text(this : Void*, _end : Pointer(Void)) : Pointer(LibC::Char)
  fun gtk_text_iter_get_toggled_tags(this : Void*, toggled_on : LibC::Int) : Pointer(LibGLib::SList)
  fun gtk_text_iter_get_type : UInt64
  fun gtk_text_iter_get_visible_line_index(this : Void*) : Int32
  fun gtk_text_iter_get_visible_line_offset(this : Void*) : Int32
  fun gtk_text_iter_get_visible_slice(this : Void*, _end : Pointer(Void)) : Pointer(LibC::Char)
  fun gtk_text_iter_get_visible_text(this : Void*, _end : Pointer(Void)) : Pointer(LibC::Char)
  fun gtk_text_iter_has_tag(this : Void*, tag : Pointer(Void)) : LibC::Int
  fun gtk_text_iter_in_range(this : Void*, start : Pointer(Void), _end : Pointer(Void)) : LibC::Int
  fun gtk_text_iter_inside_sentence(this : Void*) : LibC::Int
  fun gtk_text_iter_inside_word(this : Void*) : LibC::Int
  fun gtk_text_iter_is_cursor_position(this : Void*) : LibC::Int
  fun gtk_text_iter_is_end(this : Void*) : LibC::Int
  fun gtk_text_iter_is_start(this : Void*) : LibC::Int
  fun gtk_text_iter_order(this : Void*, second : Pointer(Void)) : Void
  fun gtk_text_iter_set_line(this : Void*, line_number : Int32) : Void
  fun gtk_text_iter_set_line_index(this : Void*, byte_on_line : Int32) : Void
  fun gtk_text_iter_set_line_offset(this : Void*, char_on_line : Int32) : Void
  fun gtk_text_iter_set_offset(this : Void*, char_offset : Int32) : Void
  fun gtk_text_iter_set_visible_line_index(this : Void*, byte_on_line : Int32) : Void
  fun gtk_text_iter_set_visible_line_offset(this : Void*, char_on_line : Int32) : Void
  fun gtk_text_iter_starts_line(this : Void*) : LibC::Int
  fun gtk_text_iter_starts_sentence(this : Void*) : LibC::Int
  fun gtk_text_iter_starts_tag(this : Void*, tag : Pointer(Void)) : LibC::Int
  fun gtk_text_iter_starts_word(this : Void*) : LibC::Int
  fun gtk_text_iter_toggles_tag(this : Void*, tag : Pointer(Void)) : LibC::Int
  fun gtk_text_mark_get_buffer(this : Void*) : Pointer(Void)
  fun gtk_text_mark_get_deleted(this : Void*) : LibC::Int
  fun gtk_text_mark_get_left_gravity(this : Void*) : LibC::Int
  fun gtk_text_mark_get_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_text_mark_get_type : UInt64
  fun gtk_text_mark_get_visible(this : Void*) : LibC::Int
  fun gtk_text_mark_new(name : Pointer(LibC::Char), left_gravity : LibC::Int) : Pointer(Void)
  fun gtk_text_mark_set_visible(this : Void*, setting : LibC::Int) : Void
  fun gtk_text_new : Pointer(Void)
  fun gtk_text_new_with_buffer(buffer : Pointer(Void)) : Pointer(Void)
  fun gtk_text_set_activates_default(this : Void*, activates : LibC::Int) : Void
  fun gtk_text_set_attributes(this : Void*, attrs : Pointer(Void)) : Void
  fun gtk_text_set_buffer(this : Void*, buffer : Pointer(Void)) : Void
  fun gtk_text_set_enable_emoji_completion(this : Void*, enable_emoji_completion : LibC::Int) : Void
  fun gtk_text_set_extra_menu(this : Void*, model : Pointer(Void)) : Void
  fun gtk_text_set_input_hints(this : Void*, hints : UInt32) : Void
  fun gtk_text_set_input_purpose(this : Void*, purpose : UInt32) : Void
  fun gtk_text_set_invisible_char(this : Void*, ch : UInt32) : Void
  fun gtk_text_set_max_length(this : Void*, length : Int32) : Void
  fun gtk_text_set_overwrite_mode(this : Void*, overwrite : LibC::Int) : Void
  fun gtk_text_set_placeholder_text(this : Void*, text : Pointer(LibC::Char)) : Void
  fun gtk_text_set_propagate_text_width(this : Void*, propagate_text_width : LibC::Int) : Void
  fun gtk_text_set_tabs(this : Void*, tabs : Pointer(Void)) : Void
  fun gtk_text_set_truncate_multiline(this : Void*, truncate_multiline : LibC::Int) : Void
  fun gtk_text_set_visibility(this : Void*, visible : LibC::Int) : Void
  fun gtk_text_tag_changed(this : Void*, size_changed : LibC::Int) : Void
  fun gtk_text_tag_get_priority(this : Void*) : Int32
  fun gtk_text_tag_get_type : UInt64
  fun gtk_text_tag_new(name : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_text_tag_set_priority(this : Void*, priority : Int32) : Void
  fun gtk_text_tag_table_add(this : Void*, tag : Pointer(Void)) : LibC::Int
  fun gtk_text_tag_table_foreach(this : Void*, func : TextTagTableForeach, data : Pointer(Void)) : Void
  fun gtk_text_tag_table_get_size(this : Void*) : Int32
  fun gtk_text_tag_table_get_type : UInt64
  fun gtk_text_tag_table_lookup(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_text_tag_table_new : Pointer(Void)
  fun gtk_text_tag_table_remove(this : Void*, tag : Pointer(Void)) : Void
  fun gtk_text_unset_invisible_char(this : Void*) : Void
  fun gtk_text_view_add_child_at_anchor(this : Void*, child : Pointer(Void), anchor : Pointer(Void)) : Void
  fun gtk_text_view_add_overlay(this : Void*, child : Pointer(Void), xpos : Int32, ypos : Int32) : Void
  fun gtk_text_view_backward_display_line(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_text_view_backward_display_line_start(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_text_view_buffer_to_window_coords(this : Void*, win : UInt32, buffer_x : Int32, buffer_y : Int32, window_x : Pointer(Int32), window_y : Pointer(Int32)) : Void
  fun gtk_text_view_forward_display_line(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_text_view_forward_display_line_end(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_text_view_get_accepts_tab(this : Void*) : LibC::Int
  fun gtk_text_view_get_bottom_margin(this : Void*) : Int32
  fun gtk_text_view_get_buffer(this : Void*) : Pointer(Void)
  fun gtk_text_view_get_cursor_locations(this : Void*, iter : Pointer(Void), strong : Pointer(Void), weak : Pointer(Void)) : Void
  fun gtk_text_view_get_cursor_visible(this : Void*) : LibC::Int
  fun gtk_text_view_get_editable(this : Void*) : LibC::Int
  fun gtk_text_view_get_extra_menu(this : Void*) : Pointer(Void)
  fun gtk_text_view_get_gutter(this : Void*, win : UInt32) : Pointer(Void)
  fun gtk_text_view_get_indent(this : Void*) : Int32
  fun gtk_text_view_get_input_hints(this : Void*) : UInt32
  fun gtk_text_view_get_input_purpose(this : Void*) : UInt32
  fun gtk_text_view_get_iter_at_location(this : Void*, iter : Pointer(Void), x : Int32, y : Int32) : LibC::Int
  fun gtk_text_view_get_iter_at_position(this : Void*, iter : Pointer(Void), trailing : Pointer(Int32), x : Int32, y : Int32) : LibC::Int
  fun gtk_text_view_get_iter_location(this : Void*, iter : Pointer(Void), location : Pointer(Void)) : Void
  fun gtk_text_view_get_justification(this : Void*) : UInt32
  fun gtk_text_view_get_left_margin(this : Void*) : Int32
  fun gtk_text_view_get_line_at_y(this : Void*, target_iter : Pointer(Void), y : Int32, line_top : Pointer(Int32)) : Void
  fun gtk_text_view_get_line_yrange(this : Void*, iter : Pointer(Void), y : Pointer(Int32), height : Pointer(Int32)) : Void
  fun gtk_text_view_get_ltr_context(this : Void*) : Pointer(Void)
  fun gtk_text_view_get_monospace(this : Void*) : LibC::Int
  fun gtk_text_view_get_overwrite(this : Void*) : LibC::Int
  fun gtk_text_view_get_pixels_above_lines(this : Void*) : Int32
  fun gtk_text_view_get_pixels_below_lines(this : Void*) : Int32
  fun gtk_text_view_get_pixels_inside_wrap(this : Void*) : Int32
  fun gtk_text_view_get_right_margin(this : Void*) : Int32
  fun gtk_text_view_get_rtl_context(this : Void*) : Pointer(Void)
  fun gtk_text_view_get_tabs(this : Void*) : Pointer(Void)
  fun gtk_text_view_get_top_margin(this : Void*) : Int32
  fun gtk_text_view_get_type : UInt64
  fun gtk_text_view_get_visible_rect(this : Void*, visible_rect : Pointer(Void)) : Void
  fun gtk_text_view_get_wrap_mode(this : Void*) : UInt32
  fun gtk_text_view_im_context_filter_keypress(this : Void*, event : Pointer(Void)) : LibC::Int
  fun gtk_text_view_move_mark_onscreen(this : Void*, mark : Pointer(Void)) : LibC::Int
  fun gtk_text_view_move_overlay(this : Void*, child : Pointer(Void), xpos : Int32, ypos : Int32) : Void
  fun gtk_text_view_move_visually(this : Void*, iter : Pointer(Void), count : Int32) : LibC::Int
  fun gtk_text_view_new : Pointer(Void)
  fun gtk_text_view_new_with_buffer(buffer : Pointer(Void)) : Pointer(Void)
  fun gtk_text_view_place_cursor_onscreen(this : Void*) : LibC::Int
  fun gtk_text_view_remove(this : Void*, child : Pointer(Void)) : Void
  fun gtk_text_view_reset_cursor_blink(this : Void*) : Void
  fun gtk_text_view_reset_im_context(this : Void*) : Void
  fun gtk_text_view_scroll_mark_onscreen(this : Void*, mark : Pointer(Void)) : Void
  fun gtk_text_view_scroll_to_iter(this : Void*, iter : Pointer(Void), within_margin : Float64, use_align : LibC::Int, xalign : Float64, yalign : Float64) : LibC::Int
  fun gtk_text_view_scroll_to_mark(this : Void*, mark : Pointer(Void), within_margin : Float64, use_align : LibC::Int, xalign : Float64, yalign : Float64) : Void
  fun gtk_text_view_set_accepts_tab(this : Void*, accepts_tab : LibC::Int) : Void
  fun gtk_text_view_set_bottom_margin(this : Void*, bottom_margin : Int32) : Void
  fun gtk_text_view_set_buffer(this : Void*, buffer : Pointer(Void)) : Void
  fun gtk_text_view_set_cursor_visible(this : Void*, setting : LibC::Int) : Void
  fun gtk_text_view_set_editable(this : Void*, setting : LibC::Int) : Void
  fun gtk_text_view_set_extra_menu(this : Void*, model : Pointer(Void)) : Void
  fun gtk_text_view_set_gutter(this : Void*, win : UInt32, widget : Pointer(Void)) : Void
  fun gtk_text_view_set_indent(this : Void*, indent : Int32) : Void
  fun gtk_text_view_set_input_hints(this : Void*, hints : UInt32) : Void
  fun gtk_text_view_set_input_purpose(this : Void*, purpose : UInt32) : Void
  fun gtk_text_view_set_justification(this : Void*, justification : UInt32) : Void
  fun gtk_text_view_set_left_margin(this : Void*, left_margin : Int32) : Void
  fun gtk_text_view_set_monospace(this : Void*, monospace : LibC::Int) : Void
  fun gtk_text_view_set_overwrite(this : Void*, overwrite : LibC::Int) : Void
  fun gtk_text_view_set_pixels_above_lines(this : Void*, pixels_above_lines : Int32) : Void
  fun gtk_text_view_set_pixels_below_lines(this : Void*, pixels_below_lines : Int32) : Void
  fun gtk_text_view_set_pixels_inside_wrap(this : Void*, pixels_inside_wrap : Int32) : Void
  fun gtk_text_view_set_right_margin(this : Void*, right_margin : Int32) : Void
  fun gtk_text_view_set_tabs(this : Void*, tabs : Pointer(Void)) : Void
  fun gtk_text_view_set_top_margin(this : Void*, top_margin : Int32) : Void
  fun gtk_text_view_set_wrap_mode(this : Void*, wrap_mode : UInt32) : Void
  fun gtk_text_view_starts_display_line(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_text_view_window_to_buffer_coords(this : Void*, win : UInt32, window_x : Int32, window_y : Int32, buffer_x : Pointer(Int32), buffer_y : Pointer(Int32)) : Void
  fun gtk_toggle_button_get_active(this : Void*) : LibC::Int
  fun gtk_toggle_button_get_type : UInt64
  fun gtk_toggle_button_new : Pointer(Void)
  fun gtk_toggle_button_new_with_label(label : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_toggle_button_new_with_mnemonic(label : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_toggle_button_set_active(this : Void*, is_active : LibC::Int) : Void
  fun gtk_toggle_button_set_group(this : Void*, group : Pointer(Void)) : Void
  fun gtk_toggle_button_toggled(this : Void*) : Void
  fun gtk_tooltip_get_type : UInt64
  fun gtk_tooltip_set_custom(this : Void*, custom_widget : Pointer(Void)) : Void
  fun gtk_tooltip_set_icon(this : Void*, paintable : Pointer(Void)) : Void
  fun gtk_tooltip_set_icon_from_gicon(this : Void*, gicon : Pointer(Void)) : Void
  fun gtk_tooltip_set_icon_from_icon_name(this : Void*, icon_name : Pointer(LibC::Char)) : Void
  fun gtk_tooltip_set_markup(this : Void*, markup : Pointer(LibC::Char)) : Void
  fun gtk_tooltip_set_text(this : Void*, text : Pointer(LibC::Char)) : Void
  fun gtk_tooltip_set_tip_area(this : Void*, rect : Pointer(Void)) : Void
  fun gtk_tree_create_row_drag_content(tree_model : Pointer(Void), path : Pointer(Void)) : Pointer(Void)
  fun gtk_tree_drag_dest_drag_data_received(this : Void*, dest : Pointer(Void), value : Pointer(Void)) : LibC::Int
  fun gtk_tree_drag_dest_get_type : UInt64
  fun gtk_tree_drag_dest_row_drop_possible(this : Void*, dest_path : Pointer(Void), value : Pointer(Void)) : LibC::Int
  fun gtk_tree_drag_source_drag_data_delete(this : Void*, path : Pointer(Void)) : LibC::Int
  fun gtk_tree_drag_source_drag_data_get(this : Void*, path : Pointer(Void)) : Pointer(Void)
  fun gtk_tree_drag_source_get_type : UInt64
  fun gtk_tree_drag_source_row_draggable(this : Void*, path : Pointer(Void)) : LibC::Int
  fun gtk_tree_expander_get_child(this : Void*) : Pointer(Void)
  fun gtk_tree_expander_get_item(this : Void*) : Pointer(Void)
  fun gtk_tree_expander_get_list_row(this : Void*) : Pointer(Void)
  fun gtk_tree_expander_get_type : UInt64
  fun gtk_tree_expander_new : Pointer(Void)
  fun gtk_tree_expander_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_tree_expander_set_list_row(this : Void*, list_row : Pointer(Void)) : Void
  fun gtk_tree_get_row_drag_data(value : Pointer(Void), tree_model : Pointer(Pointer(Void)), path : Pointer(Pointer(Void))) : LibC::Int
  fun gtk_tree_iter_copy(this : Void*) : Pointer(Void)
  fun gtk_tree_iter_free(this : Void*) : Void
  fun gtk_tree_iter_get_type : UInt64
  fun gtk_tree_list_model_get_autoexpand(this : Void*) : LibC::Int
  fun gtk_tree_list_model_get_child_row(this : Void*, position : UInt32) : Pointer(Void)
  fun gtk_tree_list_model_get_model(this : Void*) : Pointer(Void)
  fun gtk_tree_list_model_get_passthrough(this : Void*) : LibC::Int
  fun gtk_tree_list_model_get_row(this : Void*, position : UInt32) : Pointer(Void)
  fun gtk_tree_list_model_get_type : UInt64
  fun gtk_tree_list_model_new(root : Pointer(Void), passthrough : LibC::Int, autoexpand : LibC::Int, create_func : TreeListModelCreateModelFunc, user_data : Pointer(Void), user_destroy : LibGLib::DestroyNotify) : Pointer(Void)
  fun gtk_tree_list_model_set_autoexpand(this : Void*, autoexpand : LibC::Int) : Void
  fun gtk_tree_list_row_get_child_row(this : Void*, position : UInt32) : Pointer(Void)
  fun gtk_tree_list_row_get_children(this : Void*) : Pointer(Void)
  fun gtk_tree_list_row_get_depth(this : Void*) : UInt32
  fun gtk_tree_list_row_get_expanded(this : Void*) : LibC::Int
  fun gtk_tree_list_row_get_item(this : Void*) : Pointer(Void)
  fun gtk_tree_list_row_get_parent(this : Void*) : Pointer(Void)
  fun gtk_tree_list_row_get_position(this : Void*) : UInt32
  fun gtk_tree_list_row_get_type : UInt64
  fun gtk_tree_list_row_is_expandable(this : Void*) : LibC::Int
  fun gtk_tree_list_row_set_expanded(this : Void*, expanded : LibC::Int) : Void
  fun gtk_tree_list_row_sorter_get_sorter(this : Void*) : Pointer(Void)
  fun gtk_tree_list_row_sorter_get_type : UInt64
  fun gtk_tree_list_row_sorter_new(sorter : Pointer(Void)) : Pointer(Void)
  fun gtk_tree_list_row_sorter_set_sorter(this : Void*, sorter : Pointer(Void)) : Void
  fun gtk_tree_model_filter_clear_cache(this : Void*) : Void
  fun gtk_tree_model_filter_convert_child_iter_to_iter(this : Void*, filter_iter : Pointer(Void), child_iter : Pointer(Void)) : LibC::Int
  fun gtk_tree_model_filter_convert_child_path_to_path(this : Void*, child_path : Pointer(Void)) : Pointer(Void)
  fun gtk_tree_model_filter_convert_iter_to_child_iter(this : Void*, child_iter : Pointer(Void), filter_iter : Pointer(Void)) : Void
  fun gtk_tree_model_filter_convert_path_to_child_path(this : Void*, filter_path : Pointer(Void)) : Pointer(Void)
  fun gtk_tree_model_filter_get_model(this : Void*) : Pointer(Void)
  fun gtk_tree_model_filter_get_type : UInt64
  fun gtk_tree_model_filter_new(this : Void*, root : Pointer(Void)) : Pointer(Void)
  fun gtk_tree_model_filter_refilter(this : Void*) : Void
  fun gtk_tree_model_filter_set_modify_func(this : Void*, n_columns : Int32, types : Pointer(UInt64), func : TreeModelFilterModifyFunc, data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_tree_model_filter_set_visible_column(this : Void*, column : Int32) : Void
  fun gtk_tree_model_filter_set_visible_func(this : Void*, func : TreeModelFilterVisibleFunc, data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_tree_model_foreach(this : Void*, func : TreeModelForeachFunc, user_data : Pointer(Void)) : Void
  fun gtk_tree_model_get_column_type(this : Void*, index_ : Int32) : UInt64
  fun gtk_tree_model_get_flags(this : Void*) : UInt32
  fun gtk_tree_model_get_iter(this : Void*, iter : Pointer(Void), path : Pointer(Void)) : LibC::Int
  fun gtk_tree_model_get_iter_first(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_tree_model_get_iter_from_string(this : Void*, iter : Pointer(Void), path_string : Pointer(LibC::Char)) : LibC::Int
  fun gtk_tree_model_get_n_columns(this : Void*) : Int32
  fun gtk_tree_model_get_path(this : Void*, iter : Pointer(Void)) : Pointer(Void)
  fun gtk_tree_model_get_string_from_iter(this : Void*, iter : Pointer(Void)) : Pointer(LibC::Char)
  fun gtk_tree_model_get_type : UInt64
  fun gtk_tree_model_get_value(this : Void*, iter : Pointer(Void), column : Int32, value : Pointer(Void)) : Void
  fun gtk_tree_model_iter_children(this : Void*, iter : Pointer(Void), parent : Pointer(Void)) : LibC::Int
  fun gtk_tree_model_iter_has_child(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_tree_model_iter_n_children(this : Void*, iter : Pointer(Void)) : Int32
  fun gtk_tree_model_iter_next(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_tree_model_iter_nth_child(this : Void*, iter : Pointer(Void), parent : Pointer(Void), n : Int32) : LibC::Int
  fun gtk_tree_model_iter_parent(this : Void*, iter : Pointer(Void), child : Pointer(Void)) : LibC::Int
  fun gtk_tree_model_iter_previous(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_tree_model_ref_node(this : Void*, iter : Pointer(Void)) : Void
  fun gtk_tree_model_row_changed(this : Void*, path : Pointer(Void), iter : Pointer(Void)) : Void
  fun gtk_tree_model_row_deleted(this : Void*, path : Pointer(Void)) : Void
  fun gtk_tree_model_row_has_child_toggled(this : Void*, path : Pointer(Void), iter : Pointer(Void)) : Void
  fun gtk_tree_model_row_inserted(this : Void*, path : Pointer(Void), iter : Pointer(Void)) : Void
  fun gtk_tree_model_rows_reordered_with_length(this : Void*, path : Pointer(Void), iter : Pointer(Void), new_order : Pointer(Int32), length : Int32) : Void
  fun gtk_tree_model_sort_clear_cache(this : Void*) : Void
  fun gtk_tree_model_sort_convert_child_iter_to_iter(this : Void*, sort_iter : Pointer(Void), child_iter : Pointer(Void)) : LibC::Int
  fun gtk_tree_model_sort_convert_child_path_to_path(this : Void*, child_path : Pointer(Void)) : Pointer(Void)
  fun gtk_tree_model_sort_convert_iter_to_child_iter(this : Void*, child_iter : Pointer(Void), sorted_iter : Pointer(Void)) : Void
  fun gtk_tree_model_sort_convert_path_to_child_path(this : Void*, sorted_path : Pointer(Void)) : Pointer(Void)
  fun gtk_tree_model_sort_get_model(this : Void*) : Pointer(Void)
  fun gtk_tree_model_sort_get_type : UInt64
  fun gtk_tree_model_sort_iter_is_valid(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_tree_model_sort_new_with_model(child_model : Pointer(Void)) : Pointer(Void)
  fun gtk_tree_model_sort_reset_default_sort_func(this : Void*) : Void
  fun gtk_tree_model_unref_node(this : Void*, iter : Pointer(Void)) : Void
  fun gtk_tree_path_append_index(this : Void*, index_ : Int32) : Void
  fun gtk_tree_path_compare(this : Void*, b : Pointer(Void)) : Int32
  fun gtk_tree_path_copy(this : Void*) : Pointer(Void)
  fun gtk_tree_path_down(this : Void*) : Void
  fun gtk_tree_path_free(this : Void*) : Void
  fun gtk_tree_path_get_depth(this : Void*) : Int32
  fun gtk_tree_path_get_indices_with_depth(this : Void*, depth : Pointer(Int32)) : Pointer(Int32)
  fun gtk_tree_path_get_type : UInt64
  fun gtk_tree_path_is_ancestor(this : Void*, descendant : Pointer(Void)) : LibC::Int
  fun gtk_tree_path_is_descendant(this : Void*, ancestor : Pointer(Void)) : LibC::Int
  fun gtk_tree_path_new : Pointer(Void)
  fun gtk_tree_path_new_first : Pointer(Void)
  fun gtk_tree_path_new_from_indicesv(indices : Pointer(Int32), length : UInt64) : Pointer(Void)
  fun gtk_tree_path_new_from_string(path : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_tree_path_next(this : Void*) : Void
  fun gtk_tree_path_prepend_index(this : Void*, index_ : Int32) : Void
  fun gtk_tree_path_prev(this : Void*) : LibC::Int
  fun gtk_tree_path_to_string(this : Void*) : Pointer(LibC::Char)
  fun gtk_tree_path_up(this : Void*) : LibC::Int
  fun gtk_tree_row_reference_copy(this : Void*) : Pointer(Void)
  fun gtk_tree_row_reference_deleted(proxy : Pointer(Void), path : Pointer(Void)) : Void
  fun gtk_tree_row_reference_deleted(proxy : Pointer(Void), path : Pointer(Void)) : Void
  fun gtk_tree_row_reference_free(this : Void*) : Void
  fun gtk_tree_row_reference_get_model(this : Void*) : Pointer(Void)
  fun gtk_tree_row_reference_get_path(this : Void*) : Pointer(Void)
  fun gtk_tree_row_reference_get_type : UInt64
  fun gtk_tree_row_reference_inserted(proxy : Pointer(Void), path : Pointer(Void)) : Void
  fun gtk_tree_row_reference_inserted(proxy : Pointer(Void), path : Pointer(Void)) : Void
  fun gtk_tree_row_reference_new(model : Pointer(Void), path : Pointer(Void)) : Pointer(Void)
  fun gtk_tree_row_reference_new_proxy(proxy : Pointer(Void), model : Pointer(Void), path : Pointer(Void)) : Pointer(Void)
  fun gtk_tree_row_reference_valid(this : Void*) : LibC::Int
  fun gtk_tree_selection_count_selected_rows(this : Void*) : Int32
  fun gtk_tree_selection_get_mode(this : Void*) : UInt32
  fun gtk_tree_selection_get_selected(this : Void*, model : Pointer(Pointer(Void)), iter : Pointer(Void)) : LibC::Int
  fun gtk_tree_selection_get_selected_rows(this : Void*, model : Pointer(Pointer(Void))) : Pointer(LibGLib::List)
  fun gtk_tree_selection_get_tree_view(this : Void*) : Pointer(Void)
  fun gtk_tree_selection_get_type : UInt64
  fun gtk_tree_selection_iter_is_selected(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_tree_selection_path_is_selected(this : Void*, path : Pointer(Void)) : LibC::Int
  fun gtk_tree_selection_select_all(this : Void*) : Void
  fun gtk_tree_selection_select_iter(this : Void*, iter : Pointer(Void)) : Void
  fun gtk_tree_selection_select_path(this : Void*, path : Pointer(Void)) : Void
  fun gtk_tree_selection_select_range(this : Void*, start_path : Pointer(Void), end_path : Pointer(Void)) : Void
  fun gtk_tree_selection_selected_foreach(this : Void*, func : TreeSelectionForeachFunc, data : Pointer(Void)) : Void
  fun gtk_tree_selection_set_mode(this : Void*, type : UInt32) : Void
  fun gtk_tree_selection_set_select_function(this : Void*, func : TreeSelectionFunc, data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_tree_selection_unselect_all(this : Void*) : Void
  fun gtk_tree_selection_unselect_iter(this : Void*, iter : Pointer(Void)) : Void
  fun gtk_tree_selection_unselect_path(this : Void*, path : Pointer(Void)) : Void
  fun gtk_tree_selection_unselect_range(this : Void*, start_path : Pointer(Void), end_path : Pointer(Void)) : Void
  fun gtk_tree_sortable_get_sort_column_id(this : Void*, sort_column_id : Pointer(Int32), order : Pointer(UInt32)) : LibC::Int
  fun gtk_tree_sortable_get_type : UInt64
  fun gtk_tree_sortable_has_default_sort_func(this : Void*) : LibC::Int
  fun gtk_tree_sortable_set_default_sort_func(this : Void*, sort_func : TreeIterCompareFunc, user_data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_tree_sortable_set_sort_column_id(this : Void*, sort_column_id : Int32, order : UInt32) : Void
  fun gtk_tree_sortable_set_sort_func(this : Void*, sort_column_id : Int32, sort_func : TreeIterCompareFunc, user_data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_tree_sortable_sort_column_changed(this : Void*) : Void
  fun gtk_tree_store_append(this : Void*, iter : Pointer(Void), parent : Pointer(Void)) : Void
  fun gtk_tree_store_clear(this : Void*) : Void
  fun gtk_tree_store_get_type : UInt64
  fun gtk_tree_store_insert(this : Void*, iter : Pointer(Void), parent : Pointer(Void), position : Int32) : Void
  fun gtk_tree_store_insert_after(this : Void*, iter : Pointer(Void), parent : Pointer(Void), sibling : Pointer(Void)) : Void
  fun gtk_tree_store_insert_before(this : Void*, iter : Pointer(Void), parent : Pointer(Void), sibling : Pointer(Void)) : Void
  fun gtk_tree_store_insert_with_valuesv(this : Void*, iter : Pointer(Void), parent : Pointer(Void), position : Int32, columns : Pointer(Int32), values : Pointer(Void), n_values : Int32) : Void
  fun gtk_tree_store_is_ancestor(this : Void*, iter : Pointer(Void), descendant : Pointer(Void)) : LibC::Int
  fun gtk_tree_store_iter_depth(this : Void*, iter : Pointer(Void)) : Int32
  fun gtk_tree_store_iter_is_valid(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_tree_store_move_after(this : Void*, iter : Pointer(Void), position : Pointer(Void)) : Void
  fun gtk_tree_store_move_before(this : Void*, iter : Pointer(Void), position : Pointer(Void)) : Void
  fun gtk_tree_store_newv(n_columns : Int32, types : Pointer(UInt64)) : Pointer(Void)
  fun gtk_tree_store_prepend(this : Void*, iter : Pointer(Void), parent : Pointer(Void)) : Void
  fun gtk_tree_store_remove(this : Void*, iter : Pointer(Void)) : LibC::Int
  fun gtk_tree_store_set_column_types(this : Void*, n_columns : Int32, types : Pointer(UInt64)) : Void
  fun gtk_tree_store_set_value(this : Void*, iter : Pointer(Void), column : Int32, value : Pointer(Void)) : Void
  fun gtk_tree_store_set_valuesv(this : Void*, iter : Pointer(Void), columns : Pointer(Int32), values : Pointer(Void), n_values : Int32) : Void
  fun gtk_tree_store_swap(this : Void*, a : Pointer(Void), b : Pointer(Void)) : Void
  fun gtk_tree_view_append_column(this : Void*, column : Pointer(Void)) : Int32
  fun gtk_tree_view_collapse_all(this : Void*) : Void
  fun gtk_tree_view_collapse_row(this : Void*, path : Pointer(Void)) : LibC::Int
  fun gtk_tree_view_column_add_attribute(this : Void*, cell_renderer : Pointer(Void), attribute : Pointer(LibC::Char), column : Int32) : Void
  fun gtk_tree_view_column_cell_get_position(this : Void*, cell_renderer : Pointer(Void), x_offset : Pointer(Int32), width : Pointer(Int32)) : LibC::Int
  fun gtk_tree_view_column_cell_get_size(this : Void*, x_offset : Pointer(Int32), y_offset : Pointer(Int32), width : Pointer(Int32), height : Pointer(Int32)) : Void
  fun gtk_tree_view_column_cell_is_visible(this : Void*) : LibC::Int
  fun gtk_tree_view_column_cell_set_cell_data(this : Void*, tree_model : Pointer(Void), iter : Pointer(Void), is_expander : LibC::Int, is_expanded : LibC::Int) : Void
  fun gtk_tree_view_column_clear(this : Void*) : Void
  fun gtk_tree_view_column_clear_attributes(this : Void*, cell_renderer : Pointer(Void)) : Void
  fun gtk_tree_view_column_clicked(this : Void*) : Void
  fun gtk_tree_view_column_focus_cell(this : Void*, cell : Pointer(Void)) : Void
  fun gtk_tree_view_column_get_alignment(this : Void*) : Float32
  fun gtk_tree_view_column_get_button(this : Void*) : Pointer(Void)
  fun gtk_tree_view_column_get_clickable(this : Void*) : LibC::Int
  fun gtk_tree_view_column_get_expand(this : Void*) : LibC::Int
  fun gtk_tree_view_column_get_fixed_width(this : Void*) : Int32
  fun gtk_tree_view_column_get_max_width(this : Void*) : Int32
  fun gtk_tree_view_column_get_min_width(this : Void*) : Int32
  fun gtk_tree_view_column_get_reorderable(this : Void*) : LibC::Int
  fun gtk_tree_view_column_get_resizable(this : Void*) : LibC::Int
  fun gtk_tree_view_column_get_sizing(this : Void*) : UInt32
  fun gtk_tree_view_column_get_sort_column_id(this : Void*) : Int32
  fun gtk_tree_view_column_get_sort_indicator(this : Void*) : LibC::Int
  fun gtk_tree_view_column_get_sort_order(this : Void*) : UInt32
  fun gtk_tree_view_column_get_spacing(this : Void*) : Int32
  fun gtk_tree_view_column_get_title(this : Void*) : Pointer(LibC::Char)
  fun gtk_tree_view_column_get_tree_view(this : Void*) : Pointer(Void)
  fun gtk_tree_view_column_get_type : UInt64
  fun gtk_tree_view_column_get_visible(this : Void*) : LibC::Int
  fun gtk_tree_view_column_get_widget(this : Void*) : Pointer(Void)
  fun gtk_tree_view_column_get_width(this : Void*) : Int32
  fun gtk_tree_view_column_get_x_offset(this : Void*) : Int32
  fun gtk_tree_view_column_new : Pointer(Void)
  fun gtk_tree_view_column_new_with_area(area : Pointer(Void)) : Pointer(Void)
  fun gtk_tree_view_column_pack_end(this : Void*, cell : Pointer(Void), expand : LibC::Int) : Void
  fun gtk_tree_view_column_pack_start(this : Void*, cell : Pointer(Void), expand : LibC::Int) : Void
  fun gtk_tree_view_column_queue_resize(this : Void*) : Void
  fun gtk_tree_view_column_set_alignment(this : Void*, xalign : Float32) : Void
  fun gtk_tree_view_column_set_cell_data_func(this : Void*, cell_renderer : Pointer(Void), func : TreeCellDataFunc, func_data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_tree_view_column_set_clickable(this : Void*, clickable : LibC::Int) : Void
  fun gtk_tree_view_column_set_expand(this : Void*, expand : LibC::Int) : Void
  fun gtk_tree_view_column_set_fixed_width(this : Void*, fixed_width : Int32) : Void
  fun gtk_tree_view_column_set_max_width(this : Void*, max_width : Int32) : Void
  fun gtk_tree_view_column_set_min_width(this : Void*, min_width : Int32) : Void
  fun gtk_tree_view_column_set_reorderable(this : Void*, reorderable : LibC::Int) : Void
  fun gtk_tree_view_column_set_resizable(this : Void*, resizable : LibC::Int) : Void
  fun gtk_tree_view_column_set_sizing(this : Void*, type : UInt32) : Void
  fun gtk_tree_view_column_set_sort_column_id(this : Void*, sort_column_id : Int32) : Void
  fun gtk_tree_view_column_set_sort_indicator(this : Void*, setting : LibC::Int) : Void
  fun gtk_tree_view_column_set_sort_order(this : Void*, order : UInt32) : Void
  fun gtk_tree_view_column_set_spacing(this : Void*, spacing : Int32) : Void
  fun gtk_tree_view_column_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun gtk_tree_view_column_set_visible(this : Void*, visible : LibC::Int) : Void
  fun gtk_tree_view_column_set_widget(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_tree_view_columns_autosize(this : Void*) : Void
  fun gtk_tree_view_convert_bin_window_to_tree_coords(this : Void*, bx : Int32, by : Int32, tx : Pointer(Int32), ty : Pointer(Int32)) : Void
  fun gtk_tree_view_convert_bin_window_to_widget_coords(this : Void*, bx : Int32, by : Int32, wx : Pointer(Int32), wy : Pointer(Int32)) : Void
  fun gtk_tree_view_convert_tree_to_bin_window_coords(this : Void*, tx : Int32, ty : Int32, bx : Pointer(Int32), by : Pointer(Int32)) : Void
  fun gtk_tree_view_convert_tree_to_widget_coords(this : Void*, tx : Int32, ty : Int32, wx : Pointer(Int32), wy : Pointer(Int32)) : Void
  fun gtk_tree_view_convert_widget_to_bin_window_coords(this : Void*, wx : Int32, wy : Int32, bx : Pointer(Int32), by : Pointer(Int32)) : Void
  fun gtk_tree_view_convert_widget_to_tree_coords(this : Void*, wx : Int32, wy : Int32, tx : Pointer(Int32), ty : Pointer(Int32)) : Void
  fun gtk_tree_view_create_row_drag_icon(this : Void*, path : Pointer(Void)) : Pointer(Void)
  fun gtk_tree_view_enable_model_drag_dest(this : Void*, formats : Pointer(Void), actions : UInt32) : Void
  fun gtk_tree_view_enable_model_drag_source(this : Void*, start_button_mask : UInt32, formats : Pointer(Void), actions : UInt32) : Void
  fun gtk_tree_view_expand_all(this : Void*) : Void
  fun gtk_tree_view_expand_row(this : Void*, path : Pointer(Void), open_all : LibC::Int) : LibC::Int
  fun gtk_tree_view_expand_to_path(this : Void*, path : Pointer(Void)) : Void
  fun gtk_tree_view_get_activate_on_single_click(this : Void*) : LibC::Int
  fun gtk_tree_view_get_background_area(this : Void*, path : Pointer(Void), column : Pointer(Void), rect : Pointer(Void)) : Void
  fun gtk_tree_view_get_cell_area(this : Void*, path : Pointer(Void), column : Pointer(Void), rect : Pointer(Void)) : Void
  fun gtk_tree_view_get_column(this : Void*, n : Int32) : Pointer(Void)
  fun gtk_tree_view_get_columns(this : Void*) : Pointer(LibGLib::List)
  fun gtk_tree_view_get_cursor(this : Void*, path : Pointer(Pointer(Void)), focus_column : Pointer(Pointer(Void))) : Void
  fun gtk_tree_view_get_dest_row_at_pos(this : Void*, drag_x : Int32, drag_y : Int32, path : Pointer(Pointer(Void)), pos : Pointer(UInt32)) : LibC::Int
  fun gtk_tree_view_get_drag_dest_row(this : Void*, path : Pointer(Pointer(Void)), pos : Pointer(UInt32)) : Void
  fun gtk_tree_view_get_enable_search(this : Void*) : LibC::Int
  fun gtk_tree_view_get_enable_tree_lines(this : Void*) : LibC::Int
  fun gtk_tree_view_get_expander_column(this : Void*) : Pointer(Void)
  fun gtk_tree_view_get_fixed_height_mode(this : Void*) : LibC::Int
  fun gtk_tree_view_get_grid_lines(this : Void*) : UInt32
  fun gtk_tree_view_get_headers_clickable(this : Void*) : LibC::Int
  fun gtk_tree_view_get_headers_visible(this : Void*) : LibC::Int
  fun gtk_tree_view_get_hover_expand(this : Void*) : LibC::Int
  fun gtk_tree_view_get_hover_selection(this : Void*) : LibC::Int
  fun gtk_tree_view_get_level_indentation(this : Void*) : Int32
  fun gtk_tree_view_get_model(this : Void*) : Pointer(Void)
  fun gtk_tree_view_get_n_columns(this : Void*) : UInt32
  fun gtk_tree_view_get_path_at_pos(this : Void*, x : Int32, y : Int32, path : Pointer(Pointer(Void)), column : Pointer(Pointer(Void)), cell_x : Pointer(Int32), cell_y : Pointer(Int32)) : LibC::Int
  fun gtk_tree_view_get_reorderable(this : Void*) : LibC::Int
  fun gtk_tree_view_get_rubber_banding(this : Void*) : LibC::Int
  fun gtk_tree_view_get_search_column(this : Void*) : Int32
  fun gtk_tree_view_get_search_entry(this : Void*) : Pointer(Void)
  fun gtk_tree_view_get_selection(this : Void*) : Pointer(Void)
  fun gtk_tree_view_get_show_expanders(this : Void*) : LibC::Int
  fun gtk_tree_view_get_tooltip_column(this : Void*) : Int32
  fun gtk_tree_view_get_tooltip_context(this : Void*, x : Int32, y : Int32, keyboard_tip : LibC::Int, model : Pointer(Pointer(Void)), path : Pointer(Pointer(Void)), iter : Pointer(Void)) : LibC::Int
  fun gtk_tree_view_get_type : UInt64
  fun gtk_tree_view_get_visible_range(this : Void*, start_path : Pointer(Pointer(Void)), end_path : Pointer(Pointer(Void))) : LibC::Int
  fun gtk_tree_view_get_visible_rect(this : Void*, visible_rect : Pointer(Void)) : Void
  fun gtk_tree_view_insert_column(this : Void*, column : Pointer(Void), position : Int32) : Int32
  fun gtk_tree_view_insert_column_with_data_func(this : Void*, position : Int32, title : Pointer(LibC::Char), cell : Pointer(Void), func : TreeCellDataFunc, data : Pointer(Void), dnotify : LibGLib::DestroyNotify) : Int32
  fun gtk_tree_view_is_blank_at_pos(this : Void*, x : Int32, y : Int32, path : Pointer(Pointer(Void)), column : Pointer(Pointer(Void)), cell_x : Pointer(Int32), cell_y : Pointer(Int32)) : LibC::Int
  fun gtk_tree_view_is_rubber_banding_active(this : Void*) : LibC::Int
  fun gtk_tree_view_map_expanded_rows(this : Void*, func : TreeViewMappingFunc, data : Pointer(Void)) : Void
  fun gtk_tree_view_move_column_after(this : Void*, column : Pointer(Void), base_column : Pointer(Void)) : Void
  fun gtk_tree_view_new : Pointer(Void)
  fun gtk_tree_view_new_with_model(model : Pointer(Void)) : Pointer(Void)
  fun gtk_tree_view_remove_column(this : Void*, column : Pointer(Void)) : Int32
  fun gtk_tree_view_row_activated(this : Void*, path : Pointer(Void), column : Pointer(Void)) : Void
  fun gtk_tree_view_row_expanded(this : Void*, path : Pointer(Void)) : LibC::Int
  fun gtk_tree_view_scroll_to_cell(this : Void*, path : Pointer(Void), column : Pointer(Void), use_align : LibC::Int, row_align : Float32, col_align : Float32) : Void
  fun gtk_tree_view_scroll_to_point(this : Void*, tree_x : Int32, tree_y : Int32) : Void
  fun gtk_tree_view_set_activate_on_single_click(this : Void*, single : LibC::Int) : Void
  fun gtk_tree_view_set_column_drag_function(this : Void*, func : TreeViewColumnDropFunc, user_data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_tree_view_set_cursor(this : Void*, path : Pointer(Void), focus_column : Pointer(Void), start_editing : LibC::Int) : Void
  fun gtk_tree_view_set_cursor_on_cell(this : Void*, path : Pointer(Void), focus_column : Pointer(Void), focus_cell : Pointer(Void), start_editing : LibC::Int) : Void
  fun gtk_tree_view_set_drag_dest_row(this : Void*, path : Pointer(Void), pos : UInt32) : Void
  fun gtk_tree_view_set_enable_search(this : Void*, enable_search : LibC::Int) : Void
  fun gtk_tree_view_set_enable_tree_lines(this : Void*, enabled : LibC::Int) : Void
  fun gtk_tree_view_set_expander_column(this : Void*, column : Pointer(Void)) : Void
  fun gtk_tree_view_set_fixed_height_mode(this : Void*, enable : LibC::Int) : Void
  fun gtk_tree_view_set_grid_lines(this : Void*, grid_lines : UInt32) : Void
  fun gtk_tree_view_set_headers_clickable(this : Void*, setting : LibC::Int) : Void
  fun gtk_tree_view_set_headers_visible(this : Void*, headers_visible : LibC::Int) : Void
  fun gtk_tree_view_set_hover_expand(this : Void*, expand : LibC::Int) : Void
  fun gtk_tree_view_set_hover_selection(this : Void*, hover : LibC::Int) : Void
  fun gtk_tree_view_set_level_indentation(this : Void*, indentation : Int32) : Void
  fun gtk_tree_view_set_model(this : Void*, model : Pointer(Void)) : Void
  fun gtk_tree_view_set_reorderable(this : Void*, reorderable : LibC::Int) : Void
  fun gtk_tree_view_set_row_separator_func(this : Void*, func : TreeViewRowSeparatorFunc, data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Void
  fun gtk_tree_view_set_rubber_banding(this : Void*, enable : LibC::Int) : Void
  fun gtk_tree_view_set_search_column(this : Void*, column : Int32) : Void
  fun gtk_tree_view_set_search_entry(this : Void*, entry : Pointer(Void)) : Void
  fun gtk_tree_view_set_search_equal_func(this : Void*, search_equal_func : TreeViewSearchEqualFunc, search_user_data : Pointer(Void), search_destroy : LibGLib::DestroyNotify) : Void
  fun gtk_tree_view_set_show_expanders(this : Void*, enabled : LibC::Int) : Void
  fun gtk_tree_view_set_tooltip_cell(this : Void*, tooltip : Pointer(Void), path : Pointer(Void), column : Pointer(Void), cell : Pointer(Void)) : Void
  fun gtk_tree_view_set_tooltip_column(this : Void*, column : Int32) : Void
  fun gtk_tree_view_set_tooltip_row(this : Void*, tooltip : Pointer(Void), path : Pointer(Void)) : Void
  fun gtk_tree_view_unset_rows_drag_dest(this : Void*) : Void
  fun gtk_tree_view_unset_rows_drag_source(this : Void*) : Void
  fun gtk_value_dup_expression(value : Pointer(Void)) : Pointer(Void)
  fun gtk_value_get_expression(value : Pointer(Void)) : Pointer(Void)
  fun gtk_value_set_expression(value : Pointer(Void), expression : Pointer(Void)) : Void
  fun gtk_value_take_expression(value : Pointer(Void), expression : Pointer(Void)) : Void
  fun gtk_video_get_autoplay(this : Void*) : LibC::Int
  fun gtk_video_get_file(this : Void*) : Pointer(Void)
  fun gtk_video_get_loop(this : Void*) : LibC::Int
  fun gtk_video_get_media_stream(this : Void*) : Pointer(Void)
  fun gtk_video_get_type : UInt64
  fun gtk_video_new : Pointer(Void)
  fun gtk_video_new_for_file(file : Pointer(Void)) : Pointer(Void)
  fun gtk_video_new_for_filename(filename : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_video_new_for_media_stream(stream : Pointer(Void)) : Pointer(Void)
  fun gtk_video_new_for_resource(resource_path : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_video_set_autoplay(this : Void*, autoplay : LibC::Int) : Void
  fun gtk_video_set_file(this : Void*, file : Pointer(Void)) : Void
  fun gtk_video_set_filename(this : Void*, filename : Pointer(LibC::Char)) : Void
  fun gtk_video_set_loop(this : Void*, loop : LibC::Int) : Void
  fun gtk_video_set_media_stream(this : Void*, stream : Pointer(Void)) : Void
  fun gtk_video_set_resource(this : Void*, resource_path : Pointer(LibC::Char)) : Void
  fun gtk_viewport_get_child(this : Void*) : Pointer(Void)
  fun gtk_viewport_get_scroll_to_focus(this : Void*) : LibC::Int
  fun gtk_viewport_get_type : UInt64
  fun gtk_viewport_new(hadjustment : Pointer(Void), vadjustment : Pointer(Void)) : Pointer(Void)
  fun gtk_viewport_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_viewport_set_scroll_to_focus(this : Void*, scroll_to_focus : LibC::Int) : Void
  fun gtk_volume_button_get_type : UInt64
  fun gtk_volume_button_new : Pointer(Void)
  fun gtk_widget_action_set_enabled(this : Void*, action_name : Pointer(LibC::Char), enabled : LibC::Int) : Void
  fun gtk_widget_activate(this : Void*) : LibC::Int
  fun gtk_widget_activate_action_variant(this : Void*, name : Pointer(LibC::Char), args : Pointer(Void)) : LibC::Int
  fun gtk_widget_activate_default(this : Void*) : Void
  fun gtk_widget_add_controller(this : Void*, controller : Pointer(Void)) : Void
  fun gtk_widget_add_css_class(this : Void*, css_class : Pointer(LibC::Char)) : Void
  fun gtk_widget_add_mnemonic_label(this : Void*, label : Pointer(Void)) : Void
  fun gtk_widget_add_tick_callback(this : Void*, callback : TickCallback, user_data : Pointer(Void), notify : LibGLib::DestroyNotify) : UInt32
  fun gtk_widget_allocate(this : Void*, width : Int32, height : Int32, baseline : Int32, transform : Pointer(Void)) : Void
  fun gtk_widget_child_focus(this : Void*, direction : UInt32) : LibC::Int
  fun gtk_widget_class_add_shortcut(this : Void*, shortcut : Pointer(Void)) : Void
  fun gtk_widget_class_bind_template_callback_full(this : Void*, callback_name : Pointer(LibC::Char), callback_symbol : LibGObject::Callback) : Void
  fun gtk_widget_class_bind_template_child_full(this : Void*, name : Pointer(LibC::Char), internal_child : LibC::Int, struct_offset : Int64) : Void
  fun gtk_widget_class_get_accessible_role(this : Void*) : UInt32
  fun gtk_widget_class_get_activate_signal(this : Void*) : UInt32
  fun gtk_widget_class_get_css_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_widget_class_get_layout_manager_type(this : Void*) : UInt64
  fun gtk_widget_class_install_action(this : Void*, action_name : Pointer(LibC::Char), parameter_type : Pointer(LibC::Char), activate : WidgetActionActivateFunc) : Void
  fun gtk_widget_class_install_property_action(this : Void*, action_name : Pointer(LibC::Char), property_name : Pointer(LibC::Char)) : Void
  fun gtk_widget_class_query_action(this : Void*, index_ : UInt32, owner : Pointer(UInt64), action_name : Pointer(Pointer(LibC::Char)), parameter_type : Pointer(Pointer(Void)), property_name : Pointer(Pointer(LibC::Char))) : LibC::Int
  fun gtk_widget_class_set_accessible_role(this : Void*, accessible_role : UInt32) : Void
  fun gtk_widget_class_set_activate_signal(this : Void*, signal_id : UInt32) : Void
  fun gtk_widget_class_set_activate_signal_from_name(this : Void*, signal_name : Pointer(LibC::Char)) : Void
  fun gtk_widget_class_set_css_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun gtk_widget_class_set_layout_manager_type(this : Void*, type : UInt64) : Void
  fun gtk_widget_class_set_template(this : Void*, template_bytes : Pointer(Void)) : Void
  fun gtk_widget_class_set_template_from_resource(this : Void*, resource_name : Pointer(LibC::Char)) : Void
  fun gtk_widget_class_set_template_scope(this : Void*, scope : Pointer(Void)) : Void
  fun gtk_widget_compute_bounds(this : Void*, target : Pointer(Void), out_bounds : Pointer(Void)) : LibC::Int
  fun gtk_widget_compute_expand(this : Void*, orientation : UInt32) : LibC::Int
  fun gtk_widget_compute_point(this : Void*, target : Pointer(Void), point : Pointer(Void), out_point : Pointer(Void)) : LibC::Int
  fun gtk_widget_compute_transform(this : Void*, target : Pointer(Void), out_transform : Pointer(Void)) : LibC::Int
  fun gtk_widget_contains(this : Void*, x : Float64, y : Float64) : LibC::Int
  fun gtk_widget_create_pango_context(this : Void*) : Pointer(Void)
  fun gtk_widget_create_pango_layout(this : Void*, text : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_widget_error_bell(this : Void*) : Void
  fun gtk_widget_get_allocated_baseline(this : Void*) : Int32
  fun gtk_widget_get_allocated_height(this : Void*) : Int32
  fun gtk_widget_get_allocated_width(this : Void*) : Int32
  fun gtk_widget_get_allocation(this : Void*, allocation : Pointer(Void)) : Void
  fun gtk_widget_get_ancestor(this : Void*, widget_type : UInt64) : Pointer(Void)
  fun gtk_widget_get_can_focus(this : Void*) : LibC::Int
  fun gtk_widget_get_can_target(this : Void*) : LibC::Int
  fun gtk_widget_get_child_visible(this : Void*) : LibC::Int
  fun gtk_widget_get_clipboard(this : Void*) : Pointer(Void)
  fun gtk_widget_get_css_classes(this : Void*) : Pointer(Pointer(LibC::Char))
  fun gtk_widget_get_css_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_widget_get_cursor(this : Void*) : Pointer(Void)
  fun gtk_widget_get_default_direction : UInt32
  fun gtk_widget_get_direction(this : Void*) : UInt32
  fun gtk_widget_get_display(this : Void*) : Pointer(Void)
  fun gtk_widget_get_first_child(this : Void*) : Pointer(Void)
  fun gtk_widget_get_focus_child(this : Void*) : Pointer(Void)
  fun gtk_widget_get_focus_on_click(this : Void*) : LibC::Int
  fun gtk_widget_get_focusable(this : Void*) : LibC::Int
  fun gtk_widget_get_font_map(this : Void*) : Pointer(Void)
  fun gtk_widget_get_font_options(this : Void*) : Pointer(Void)
  fun gtk_widget_get_frame_clock(this : Void*) : Pointer(Void)
  fun gtk_widget_get_halign(this : Void*) : UInt32
  fun gtk_widget_get_has_tooltip(this : Void*) : LibC::Int
  fun gtk_widget_get_height(this : Void*) : Int32
  fun gtk_widget_get_hexpand(this : Void*) : LibC::Int
  fun gtk_widget_get_hexpand_set(this : Void*) : LibC::Int
  fun gtk_widget_get_last_child(this : Void*) : Pointer(Void)
  fun gtk_widget_get_layout_manager(this : Void*) : Pointer(Void)
  fun gtk_widget_get_mapped(this : Void*) : LibC::Int
  fun gtk_widget_get_margin_bottom(this : Void*) : Int32
  fun gtk_widget_get_margin_end(this : Void*) : Int32
  fun gtk_widget_get_margin_start(this : Void*) : Int32
  fun gtk_widget_get_margin_top(this : Void*) : Int32
  fun gtk_widget_get_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_widget_get_native(this : Void*) : Pointer(Void)
  fun gtk_widget_get_next_sibling(this : Void*) : Pointer(Void)
  fun gtk_widget_get_opacity(this : Void*) : Float64
  fun gtk_widget_get_overflow(this : Void*) : UInt32
  fun gtk_widget_get_pango_context(this : Void*) : Pointer(Void)
  fun gtk_widget_get_parent(this : Void*) : Pointer(Void)
  fun gtk_widget_get_preferred_size(this : Void*, minimum_size : Pointer(Void), natural_size : Pointer(Void)) : Void
  fun gtk_widget_get_prev_sibling(this : Void*) : Pointer(Void)
  fun gtk_widget_get_primary_clipboard(this : Void*) : Pointer(Void)
  fun gtk_widget_get_realized(this : Void*) : LibC::Int
  fun gtk_widget_get_receives_default(this : Void*) : LibC::Int
  fun gtk_widget_get_request_mode(this : Void*) : UInt32
  fun gtk_widget_get_root(this : Void*) : Pointer(Void)
  fun gtk_widget_get_scale_factor(this : Void*) : Int32
  fun gtk_widget_get_sensitive(this : Void*) : LibC::Int
  fun gtk_widget_get_settings(this : Void*) : Pointer(Void)
  fun gtk_widget_get_size(this : Void*, orientation : UInt32) : Int32
  fun gtk_widget_get_size_request(this : Void*, width : Pointer(Int32), height : Pointer(Int32)) : Void
  fun gtk_widget_get_state_flags(this : Void*) : UInt32
  fun gtk_widget_get_style_context(this : Void*) : Pointer(Void)
  fun gtk_widget_get_template_child(this : Void*, widget_type : UInt64, name : Pointer(LibC::Char)) : Pointer(Void)
  fun gtk_widget_get_tooltip_markup(this : Void*) : Pointer(LibC::Char)
  fun gtk_widget_get_tooltip_text(this : Void*) : Pointer(LibC::Char)
  fun gtk_widget_get_type : UInt64
  fun gtk_widget_get_valign(this : Void*) : UInt32
  fun gtk_widget_get_vexpand(this : Void*) : LibC::Int
  fun gtk_widget_get_vexpand_set(this : Void*) : LibC::Int
  fun gtk_widget_get_visible(this : Void*) : LibC::Int
  fun gtk_widget_get_width(this : Void*) : Int32
  fun gtk_widget_grab_focus(this : Void*) : LibC::Int
  fun gtk_widget_has_css_class(this : Void*, css_class : Pointer(LibC::Char)) : LibC::Int
  fun gtk_widget_has_default(this : Void*) : LibC::Int
  fun gtk_widget_has_focus(this : Void*) : LibC::Int
  fun gtk_widget_has_visible_focus(this : Void*) : LibC::Int
  fun gtk_widget_hide(this : Void*) : Void
  fun gtk_widget_in_destruction(this : Void*) : LibC::Int
  fun gtk_widget_init_template(this : Void*) : Void
  fun gtk_widget_insert_action_group(this : Void*, name : Pointer(LibC::Char), group : Pointer(Void)) : Void
  fun gtk_widget_insert_after(this : Void*, parent : Pointer(Void), previous_sibling : Pointer(Void)) : Void
  fun gtk_widget_insert_before(this : Void*, parent : Pointer(Void), next_sibling : Pointer(Void)) : Void
  fun gtk_widget_is_ancestor(this : Void*, ancestor : Pointer(Void)) : LibC::Int
  fun gtk_widget_is_drawable(this : Void*) : LibC::Int
  fun gtk_widget_is_focus(this : Void*) : LibC::Int
  fun gtk_widget_is_sensitive(this : Void*) : LibC::Int
  fun gtk_widget_is_visible(this : Void*) : LibC::Int
  fun gtk_widget_keynav_failed(this : Void*, direction : UInt32) : LibC::Int
  fun gtk_widget_list_mnemonic_labels(this : Void*) : Pointer(LibGLib::List)
  fun gtk_widget_map(this : Void*) : Void
  fun gtk_widget_measure(this : Void*, orientation : UInt32, for_size : Int32, minimum : Pointer(Int32), natural : Pointer(Int32), minimum_baseline : Pointer(Int32), natural_baseline : Pointer(Int32)) : Void
  fun gtk_widget_mnemonic_activate(this : Void*, group_cycling : LibC::Int) : LibC::Int
  fun gtk_widget_observe_children(this : Void*) : Pointer(Void)
  fun gtk_widget_observe_controllers(this : Void*) : Pointer(Void)
  fun gtk_widget_paintable_get_type : UInt64
  fun gtk_widget_paintable_get_widget(this : Void*) : Pointer(Void)
  fun gtk_widget_paintable_new(widget : Pointer(Void)) : Pointer(Void)
  fun gtk_widget_paintable_set_widget(this : Void*, widget : Pointer(Void)) : Void
  fun gtk_widget_pick(this : Void*, x : Float64, y : Float64, flags : UInt32) : Pointer(Void)
  fun gtk_widget_queue_allocate(this : Void*) : Void
  fun gtk_widget_queue_draw(this : Void*) : Void
  fun gtk_widget_queue_resize(this : Void*) : Void
  fun gtk_widget_realize(this : Void*) : Void
  fun gtk_widget_remove_controller(this : Void*, controller : Pointer(Void)) : Void
  fun gtk_widget_remove_css_class(this : Void*, css_class : Pointer(LibC::Char)) : Void
  fun gtk_widget_remove_mnemonic_label(this : Void*, label : Pointer(Void)) : Void
  fun gtk_widget_remove_tick_callback(this : Void*, id : UInt32) : Void
  fun gtk_widget_set_can_focus(this : Void*, can_focus : LibC::Int) : Void
  fun gtk_widget_set_can_target(this : Void*, can_target : LibC::Int) : Void
  fun gtk_widget_set_child_visible(this : Void*, child_visible : LibC::Int) : Void
  fun gtk_widget_set_css_classes(this : Void*, classes : Pointer(Pointer(LibC::Char))) : Void
  fun gtk_widget_set_cursor(this : Void*, cursor : Pointer(Void)) : Void
  fun gtk_widget_set_cursor_from_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun gtk_widget_set_default_direction(dir : UInt32) : Void
  fun gtk_widget_set_direction(this : Void*, dir : UInt32) : Void
  fun gtk_widget_set_focus_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_widget_set_focus_on_click(this : Void*, focus_on_click : LibC::Int) : Void
  fun gtk_widget_set_focusable(this : Void*, focusable : LibC::Int) : Void
  fun gtk_widget_set_font_map(this : Void*, font_map : Pointer(Void)) : Void
  fun gtk_widget_set_font_options(this : Void*, options : Pointer(Void)) : Void
  fun gtk_widget_set_halign(this : Void*, align : UInt32) : Void
  fun gtk_widget_set_has_tooltip(this : Void*, has_tooltip : LibC::Int) : Void
  fun gtk_widget_set_hexpand(this : Void*, expand : LibC::Int) : Void
  fun gtk_widget_set_hexpand_set(this : Void*, set : LibC::Int) : Void
  fun gtk_widget_set_layout_manager(this : Void*, layout_manager : Pointer(Void)) : Void
  fun gtk_widget_set_margin_bottom(this : Void*, margin : Int32) : Void
  fun gtk_widget_set_margin_end(this : Void*, margin : Int32) : Void
  fun gtk_widget_set_margin_start(this : Void*, margin : Int32) : Void
  fun gtk_widget_set_margin_top(this : Void*, margin : Int32) : Void
  fun gtk_widget_set_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun gtk_widget_set_opacity(this : Void*, opacity : Float64) : Void
  fun gtk_widget_set_overflow(this : Void*, overflow : UInt32) : Void
  fun gtk_widget_set_parent(this : Void*, parent : Pointer(Void)) : Void
  fun gtk_widget_set_receives_default(this : Void*, receives_default : LibC::Int) : Void
  fun gtk_widget_set_sensitive(this : Void*, sensitive : LibC::Int) : Void
  fun gtk_widget_set_size_request(this : Void*, width : Int32, height : Int32) : Void
  fun gtk_widget_set_state_flags(this : Void*, flags : UInt32, clear : LibC::Int) : Void
  fun gtk_widget_set_tooltip_markup(this : Void*, markup : Pointer(LibC::Char)) : Void
  fun gtk_widget_set_tooltip_text(this : Void*, text : Pointer(LibC::Char)) : Void
  fun gtk_widget_set_valign(this : Void*, align : UInt32) : Void
  fun gtk_widget_set_vexpand(this : Void*, expand : LibC::Int) : Void
  fun gtk_widget_set_vexpand_set(this : Void*, set : LibC::Int) : Void
  fun gtk_widget_set_visible(this : Void*, visible : LibC::Int) : Void
  fun gtk_widget_should_layout(this : Void*) : LibC::Int
  fun gtk_widget_show(this : Void*) : Void
  fun gtk_widget_size_allocate(this : Void*, allocation : Pointer(Void), baseline : Int32) : Void
  fun gtk_widget_snapshot_child(this : Void*, child : Pointer(Void), snapshot : Pointer(Void)) : Void
  fun gtk_widget_translate_coordinates(this : Void*, dest_widget : Pointer(Void), src_x : Float64, src_y : Float64, dest_x : Pointer(Float64), dest_y : Pointer(Float64)) : LibC::Int
  fun gtk_widget_trigger_tooltip_query(this : Void*) : Void
  fun gtk_widget_unmap(this : Void*) : Void
  fun gtk_widget_unparent(this : Void*) : Void
  fun gtk_widget_unrealize(this : Void*) : Void
  fun gtk_widget_unset_state_flags(this : Void*, flags : UInt32) : Void
  fun gtk_window_close(this : Void*) : Void
  fun gtk_window_controls_get_decoration_layout(this : Void*) : Pointer(LibC::Char)
  fun gtk_window_controls_get_empty(this : Void*) : LibC::Int
  fun gtk_window_controls_get_side(this : Void*) : UInt32
  fun gtk_window_controls_get_type : UInt64
  fun gtk_window_controls_new(side : UInt32) : Pointer(Void)
  fun gtk_window_controls_set_decoration_layout(this : Void*, layout : Pointer(LibC::Char)) : Void
  fun gtk_window_controls_set_side(this : Void*, side : UInt32) : Void
  fun gtk_window_destroy(this : Void*) : Void
  fun gtk_window_fullscreen(this : Void*) : Void
  fun gtk_window_fullscreen_on_monitor(this : Void*, monitor : Pointer(Void)) : Void
  fun gtk_window_get_application(this : Void*) : Pointer(Void)
  fun gtk_window_get_child(this : Void*) : Pointer(Void)
  fun gtk_window_get_decorated(this : Void*) : LibC::Int
  fun gtk_window_get_default_icon_name : Pointer(LibC::Char)
  fun gtk_window_get_default_size(this : Void*, width : Pointer(Int32), height : Pointer(Int32)) : Void
  fun gtk_window_get_default_widget(this : Void*) : Pointer(Void)
  fun gtk_window_get_deletable(this : Void*) : LibC::Int
  fun gtk_window_get_destroy_with_parent(this : Void*) : LibC::Int
  fun gtk_window_get_focus(this : Void*) : Pointer(Void)
  fun gtk_window_get_focus_visible(this : Void*) : LibC::Int
  fun gtk_window_get_group(this : Void*) : Pointer(Void)
  fun gtk_window_get_handle_menubar_accel(this : Void*) : LibC::Int
  fun gtk_window_get_hide_on_close(this : Void*) : LibC::Int
  fun gtk_window_get_icon_name(this : Void*) : Pointer(LibC::Char)
  fun gtk_window_get_mnemonics_visible(this : Void*) : LibC::Int
  fun gtk_window_get_modal(this : Void*) : LibC::Int
  fun gtk_window_get_resizable(this : Void*) : LibC::Int
  fun gtk_window_get_title(this : Void*) : Pointer(LibC::Char)
  fun gtk_window_get_titlebar(this : Void*) : Pointer(Void)
  fun gtk_window_get_toplevels : Pointer(Void)
  fun gtk_window_get_transient_for(this : Void*) : Pointer(Void)
  fun gtk_window_get_type : UInt64
  fun gtk_window_group_add_window(this : Void*, window : Pointer(Void)) : Void
  fun gtk_window_group_get_type : UInt64
  fun gtk_window_group_list_windows(this : Void*) : Pointer(LibGLib::List)
  fun gtk_window_group_new : Pointer(Void)
  fun gtk_window_group_remove_window(this : Void*, window : Pointer(Void)) : Void
  fun gtk_window_handle_get_child(this : Void*) : Pointer(Void)
  fun gtk_window_handle_get_type : UInt64
  fun gtk_window_handle_new : Pointer(Void)
  fun gtk_window_handle_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_window_has_group(this : Void*) : LibC::Int
  fun gtk_window_is_active(this : Void*) : LibC::Int
  fun gtk_window_is_fullscreen(this : Void*) : LibC::Int
  fun gtk_window_is_maximized(this : Void*) : LibC::Int
  fun gtk_window_list_toplevels : Pointer(LibGLib::List)
  fun gtk_window_maximize(this : Void*) : Void
  fun gtk_window_minimize(this : Void*) : Void
  fun gtk_window_new : Pointer(Void)
  fun gtk_window_present(this : Void*) : Void
  fun gtk_window_present_with_time(this : Void*, timestamp : UInt32) : Void
  fun gtk_window_set_application(this : Void*, application : Pointer(Void)) : Void
  fun gtk_window_set_auto_startup_notification(setting : LibC::Int) : Void
  fun gtk_window_set_child(this : Void*, child : Pointer(Void)) : Void
  fun gtk_window_set_decorated(this : Void*, setting : LibC::Int) : Void
  fun gtk_window_set_default_icon_name(name : Pointer(LibC::Char)) : Void
  fun gtk_window_set_default_size(this : Void*, width : Int32, height : Int32) : Void
  fun gtk_window_set_default_widget(this : Void*, default_widget : Pointer(Void)) : Void
  fun gtk_window_set_deletable(this : Void*, setting : LibC::Int) : Void
  fun gtk_window_set_destroy_with_parent(this : Void*, setting : LibC::Int) : Void
  fun gtk_window_set_display(this : Void*, display : Pointer(Void)) : Void
  fun gtk_window_set_focus(this : Void*, focus : Pointer(Void)) : Void
  fun gtk_window_set_focus_visible(this : Void*, setting : LibC::Int) : Void
  fun gtk_window_set_handle_menubar_accel(this : Void*, handle_menubar_accel : LibC::Int) : Void
  fun gtk_window_set_hide_on_close(this : Void*, setting : LibC::Int) : Void
  fun gtk_window_set_icon_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun gtk_window_set_interactive_debugging(enable : LibC::Int) : Void
  fun gtk_window_set_mnemonics_visible(this : Void*, setting : LibC::Int) : Void
  fun gtk_window_set_modal(this : Void*, modal : LibC::Int) : Void
  fun gtk_window_set_resizable(this : Void*, resizable : LibC::Int) : Void
  fun gtk_window_set_startup_id(this : Void*, startup_id : Pointer(LibC::Char)) : Void
  fun gtk_window_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun gtk_window_set_titlebar(this : Void*, titlebar : Pointer(Void)) : Void
  fun gtk_window_set_transient_for(this : Void*, parent : Pointer(Void)) : Void
  fun gtk_window_unfullscreen(this : Void*) : Void
  fun gtk_window_unmaximize(this : Void*) : Void
  fun gtk_window_unminimize(this : Void*) : Void
end

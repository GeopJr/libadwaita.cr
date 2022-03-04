require "../g_object-2.0/initially_unowned"

module Gtk
  # An object for rendering a single cell
  #
  # The `GtkCellRenderer` is a base class of a set of objects used for
  # rendering a cell to a `cairo_t`.  These objects are used primarily by
  # the `GtkTreeView` widget, though they aren’t tied to them in any
  # specific way.  It is worth noting that `GtkCellRenderer` is not a
  # `GtkWidget` and cannot be treated as such.
  #
  # The primary use of a `GtkCellRenderer` is for drawing a certain graphical
  # elements on a `cairo_t`. Typically, one cell renderer is used to
  # draw many cells on the screen.  To this extent, it isn’t expected that a
  # CellRenderer keep any permanent state around.  Instead, any state is set
  # just prior to use using `GObject`s property system.  Then, the
  # cell is measured using gtk_cell_renderer_get_preferred_size(). Finally, the cell
  # is rendered in the correct location using gtk_cell_renderer_snapshot().
  #
  # There are a number of rules that must be followed when writing a new
  # `GtkCellRenderer`.  First and foremost, it’s important that a certain set
  # of properties will always yield a cell renderer of the same size,
  # barring a style change. The `GtkCellRenderer` also has a number of
  # generic properties that are expected to be honored by all children.
  #
  # Beyond merely rendering a cell, cell renderers can optionally
  # provide active user interface elements. A cell renderer can be
  # “activatable” like `GtkCellRenderer`Toggle,
  # which toggles when it gets activated by a mouse click, or it can be
  # “editable” like `GtkCellRenderer`Text, which
  # allows the user to edit the text using a widget implementing the
  # `GtkCellEditable` interface, e.g. `GtkEntry`.
  # To make a cell renderer activatable or editable, you have to
  # implement the `GtkCellRenderer`Class.activate or
  # `GtkCellRenderer`Class.start_editing virtual functions, respectively.
  #
  # Many properties of `GtkCellRenderer` and its subclasses have a
  # corresponding “set” property, e.g. “cell-background-set” corresponds
  # to “cell-background”. These “set” properties reflect whether a property
  # has been set or not. You should not set them independently.
  class CellRenderer < GObject::InitiallyUnowned
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, cell_background : ::String? = nil, cell_background_rgba : Gdk::RGBA? = nil, cell_background_set : Bool? = nil, editing : Bool? = nil, height : Int32? = nil, is_expanded : Bool? = nil, is_expander : Bool? = nil, mode : Gtk::CellRendererMode? = nil, sensitive : Bool? = nil, visible : Bool? = nil, width : Int32? = nil, xalign : Float32? = nil, xpad : UInt32? = nil, yalign : Float32? = nil, ypad : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[15]
      _values = StaticArray(LibGObject::Value, 15).new(LibGObject::Value.new)
      _n = 0

      if cell_background
        (_names.to_unsafe + _n).value = "cell-background".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_background)
        _n += 1
      end
      if cell_background_rgba
        (_names.to_unsafe + _n).value = "cell-background-rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_background_rgba)
        _n += 1
      end
      if cell_background_set
        (_names.to_unsafe + _n).value = "cell-background-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_background_set)
        _n += 1
      end
      if editing
        (_names.to_unsafe + _n).value = "editing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editing)
        _n += 1
      end
      if height
        (_names.to_unsafe + _n).value = "height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height)
        _n += 1
      end
      if is_expanded
        (_names.to_unsafe + _n).value = "is-expanded".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_expanded)
        _n += 1
      end
      if is_expander
        (_names.to_unsafe + _n).value = "is-expander".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_expander)
        _n += 1
      end
      if mode
        (_names.to_unsafe + _n).value = "mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mode)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if width
        (_names.to_unsafe + _n).value = "width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width)
        _n += 1
      end
      if xalign
        (_names.to_unsafe + _n).value = "xalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xalign)
        _n += 1
      end
      if xpad
        (_names.to_unsafe + _n).value = "xpad".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xpad)
        _n += 1
      end
      if yalign
        (_names.to_unsafe + _n).value = "yalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, yalign)
        _n += 1
      end
      if ypad
        (_names.to_unsafe + _n).value = "ypad".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ypad)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(CellRenderer.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_renderer_get_type
    end

    def cell_background=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "cell-background", unsafe_value, Pointer(Void).null)
      value
    end

    def cell_background_rgba=(value : Gdk::RGBA?) : Gdk::RGBA?
      unsafe_value = value

      LibGObject.g_object_set(self, "cell-background-rgba", unsafe_value, Pointer(Void).null)
      value
    end

    def cell_background_rgba : Gdk::RGBA?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "cell-background-rgba", pointerof(value), Pointer(Void).null)
      Gdk::RGBA.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def cell_background_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "cell-background-set", unsafe_value, Pointer(Void).null)
      value
    end

    def cell_background_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "cell-background-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def editing? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "editing", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def height=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "height", unsafe_value, Pointer(Void).null)
      value
    end

    def height : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "height", pointerof(value), Pointer(Void).null)
      value
    end

    def is_expanded=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "is-expanded", unsafe_value, Pointer(Void).null)
      value
    end

    def is_expanded? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-expanded", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def is_expander=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "is-expander", unsafe_value, Pointer(Void).null)
      value
    end

    def is_expander? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-expander", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def mode=(value : Gtk::CellRendererMode) : Gtk::CellRendererMode
      unsafe_value = value

      LibGObject.g_object_set(self, "mode", unsafe_value, Pointer(Void).null)
      value
    end

    def mode : Gtk::CellRendererMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "mode", pointerof(value), Pointer(Void).null)
      Gtk::CellRendererMode.from_value(value)
    end

    def sensitive=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "sensitive", unsafe_value, Pointer(Void).null)
      value
    end

    def sensitive? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "sensitive", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def visible=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "visible", unsafe_value, Pointer(Void).null)
      value
    end

    def visible? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "visible", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def width=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "width", unsafe_value, Pointer(Void).null)
      value
    end

    def width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "width", pointerof(value), Pointer(Void).null)
      value
    end

    def xalign=(value : Float32) : Float32
      unsafe_value = value

      LibGObject.g_object_set(self, "xalign", unsafe_value, Pointer(Void).null)
      value
    end

    def xalign : Float32
      # Returns: None

      value = uninitialized Float32
      LibGObject.g_object_get(self, "xalign", pointerof(value), Pointer(Void).null)
      value
    end

    def xpad=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "xpad", unsafe_value, Pointer(Void).null)
      value
    end

    def xpad : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "xpad", pointerof(value), Pointer(Void).null)
      value
    end

    def yalign=(value : Float32) : Float32
      unsafe_value = value

      LibGObject.g_object_set(self, "yalign", unsafe_value, Pointer(Void).null)
      value
    end

    def yalign : Float32
      # Returns: None

      value = uninitialized Float32
      LibGObject.g_object_get(self, "yalign", pointerof(value), Pointer(Void).null)
      value
    end

    def ypad=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "ypad", unsafe_value, Pointer(Void).null)
      value
    end

    def ypad : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "ypad", pointerof(value), Pointer(Void).null)
      value
    end

    def activate(event : Gdk::Event, widget : Gtk::Widget, path : ::String, background_area : Gdk::Rectangle, cell_area : Gdk::Rectangle, flags : Gtk::CellRendererState) : Bool
      # gtk_cell_renderer_activate: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_cell_renderer_activate(self, event, widget, path, background_area, cell_area, flags)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def aligned_area(widget : Gtk::Widget, flags : Gtk::CellRendererState, cell_area : Gdk::Rectangle) : Gdk::Rectangle
      # gtk_cell_renderer_get_aligned_area: (Method)
      # @aligned_area: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      aligned_area = Gdk::Rectangle.new

      # C call
      LibGtk.gtk_cell_renderer_get_aligned_area(self, widget, flags, cell_area, aligned_area)

      # Return value handling
      aligned_area
    end

    def alignment : Nil
      # gtk_cell_renderer_get_alignment: (Method)
      # @xalign: (out) (transfer full) (optional)
      # @yalign: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      xalign = Pointer(Float32).null
      yalign = Pointer(Float32).null

      # C call
      LibGtk.gtk_cell_renderer_get_alignment(self, xalign, yalign)

      # Return value handling
    end

    def fixed_size : Nil
      # gtk_cell_renderer_get_fixed_size: (Method)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      width = Pointer(Int32).null
      height = Pointer(Int32).null

      # C call
      LibGtk.gtk_cell_renderer_get_fixed_size(self, width, height)

      # Return value handling
    end

    def is_expanded : Bool
      # gtk_cell_renderer_get_is_expanded: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_cell_renderer_get_is_expanded(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_expander : Bool
      # gtk_cell_renderer_get_is_expander: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_cell_renderer_get_is_expander(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def padding : Nil
      # gtk_cell_renderer_get_padding: (Method)
      # @xpad: (out) (transfer full) (optional)
      # @ypad: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      xpad = Pointer(Int32).null
      ypad = Pointer(Int32).null

      # C call
      LibGtk.gtk_cell_renderer_get_padding(self, xpad, ypad)

      # Return value handling
    end

    def preferred_height(widget : Gtk::Widget) : Nil
      # gtk_cell_renderer_get_preferred_height: (Method)
      # @minimum_size: (out) (transfer full) (optional)
      # @natural_size: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      minimum_size = Pointer(Int32).null
      natural_size = Pointer(Int32).null

      # C call
      LibGtk.gtk_cell_renderer_get_preferred_height(self, widget, minimum_size, natural_size)

      # Return value handling
    end

    def preferred_height_for_width(widget : Gtk::Widget, width : Int32) : Nil
      # gtk_cell_renderer_get_preferred_height_for_width: (Method)
      # @minimum_height: (out) (transfer full) (optional)
      # @natural_height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      minimum_height = Pointer(Int32).null
      natural_height = Pointer(Int32).null

      # C call
      LibGtk.gtk_cell_renderer_get_preferred_height_for_width(self, widget, width, minimum_height, natural_height)

      # Return value handling
    end

    def preferred_size(widget : Gtk::Widget) : Gtk::Requisition
      # gtk_cell_renderer_get_preferred_size: (Method)
      # @minimum_size: (out) (caller-allocates) (optional)
      # @natural_size: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Handle parameters
      minimum_size = Pointer(Void).null
      natural_size = Pointer(Void).null
      minimum_size = Gtk::Requisition.new

      # C call
      LibGtk.gtk_cell_renderer_get_preferred_size(self, widget, minimum_size, natural_size)

      # Return value handling
      minimum_size
    end

    def preferred_width(widget : Gtk::Widget) : Nil
      # gtk_cell_renderer_get_preferred_width: (Method)
      # @minimum_size: (out) (transfer full) (optional)
      # @natural_size: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      minimum_size = Pointer(Int32).null
      natural_size = Pointer(Int32).null

      # C call
      LibGtk.gtk_cell_renderer_get_preferred_width(self, widget, minimum_size, natural_size)

      # Return value handling
    end

    def preferred_width_for_height(widget : Gtk::Widget, height : Int32) : Nil
      # gtk_cell_renderer_get_preferred_width_for_height: (Method)
      # @minimum_width: (out) (transfer full) (optional)
      # @natural_width: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      minimum_width = Pointer(Int32).null
      natural_width = Pointer(Int32).null

      # C call
      LibGtk.gtk_cell_renderer_get_preferred_width_for_height(self, widget, height, minimum_width, natural_width)

      # Return value handling
    end

    def request_mode : Gtk::SizeRequestMode
      # gtk_cell_renderer_get_request_mode: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_cell_renderer_get_request_mode(self)

      # Return value handling
      Gtk::SizeRequestMode.from_value(_retval)
    end

    def sensitive : Bool
      # gtk_cell_renderer_get_sensitive: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_cell_renderer_get_sensitive(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def state(widget : Gtk::Widget?, cell_state : Gtk::CellRendererState) : Gtk::StateFlags
      # gtk_cell_renderer_get_state: (Method)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      _retval = LibGtk.gtk_cell_renderer_get_state(self, widget, cell_state)

      # Return value handling
      Gtk::StateFlags.from_value(_retval)
    end

    def visible : Bool
      # gtk_cell_renderer_get_visible: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_cell_renderer_get_visible(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_activatable : Bool
      # gtk_cell_renderer_is_activatable: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_cell_renderer_is_activatable(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_alignment(xalign : Float32, yalign : Float32) : Nil
      # gtk_cell_renderer_set_alignment: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_cell_renderer_set_alignment(self, xalign, yalign)

      # Return value handling
    end

    def set_fixed_size(width : Int32, height : Int32) : Nil
      # gtk_cell_renderer_set_fixed_size: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_cell_renderer_set_fixed_size(self, width, height)

      # Return value handling
    end

    def is_expanded=(is_expanded : Bool) : Nil
      # gtk_cell_renderer_set_is_expanded: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_cell_renderer_set_is_expanded(self, is_expanded)

      # Return value handling
    end

    def is_expander=(is_expander : Bool) : Nil
      # gtk_cell_renderer_set_is_expander: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_cell_renderer_set_is_expander(self, is_expander)

      # Return value handling
    end

    def set_padding(xpad : Int32, ypad : Int32) : Nil
      # gtk_cell_renderer_set_padding: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_cell_renderer_set_padding(self, xpad, ypad)

      # Return value handling
    end

    def sensitive=(sensitive : Bool) : Nil
      # gtk_cell_renderer_set_sensitive: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_cell_renderer_set_sensitive(self, sensitive)

      # Return value handling
    end

    def visible=(visible : Bool) : Nil
      # gtk_cell_renderer_set_visible: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_cell_renderer_set_visible(self, visible)

      # Return value handling
    end

    def snapshot(snapshot : Gtk::Snapshot, widget : Gtk::Widget, background_area : Gdk::Rectangle, cell_area : Gdk::Rectangle, flags : Gtk::CellRendererState) : Nil
      # gtk_cell_renderer_snapshot: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_cell_renderer_snapshot(self, snapshot, widget, background_area, cell_area, flags)

      # Return value handling
    end

    def start_editing(event : Gdk::Event?, widget : Gtk::Widget, path : ::String, background_area : Gdk::Rectangle, cell_area : Gdk::Rectangle, flags : Gtk::CellRendererState) : Gtk::CellEditable?
      # gtk_cell_renderer_start_editing: (Method)
      # @event: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      event = if event.nil?
                Pointer(Void).null
              else
                event.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_cell_renderer_start_editing(self, event, widget, path, background_area, cell_area, flags)

      # Return value handling
      Gtk::CellEditable__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def stop_editing(canceled : Bool) : Nil
      # gtk_cell_renderer_stop_editing: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_cell_renderer_stop_editing(self, canceled)

      # Return value handling
    end

    struct EditingCanceledSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "editing-canceled::#{@detail}" : "editing-canceled"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::CellRenderer, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::CellRenderer.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CellRenderer, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CellRenderer, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::CellRenderer.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CellRenderer, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "editing-canceled")
      end
    end

    def editing_canceled_signal
      EditingCanceledSignal.new(self)
    end

    struct EditingStartedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "editing-started::#{@detail}" : "editing-started"
      end

      def connect(&block : Proc(Gtk::CellEditable, ::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::CellEditable, ::String, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::CellEditable, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = Gtk::CellEditable__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = ::String.new(lib_arg1)
          ::Box(Proc(Gtk::CellEditable, ::String, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CellEditable, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = Gtk::CellEditable__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = ::String.new(lib_arg1)
          ::Box(Proc(Gtk::CellEditable, ::String, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::CellRenderer, Gtk::CellEditable, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::CellRenderer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::CellEditable__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = ::String.new(lib_arg1)
          ::Box(Proc(Gtk::CellRenderer, Gtk::CellEditable, ::String, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CellRenderer, Gtk::CellEditable, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::CellRenderer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::CellEditable__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = ::String.new(lib_arg1)
          ::Box(Proc(Gtk::CellRenderer, Gtk::CellEditable, ::String, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(editable : Gtk::CellEditable, path : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "editing-started", editable, path)
      end
    end

    def editing_started_signal
      EditingStartedSignal.new(self)
    end
  end
end

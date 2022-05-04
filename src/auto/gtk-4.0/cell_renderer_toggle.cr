require "./cell_renderer"

module Gtk
  # Renders a toggle button in a cell
  #
  # `GtkCellRendererToggle` renders a toggle button in a cell. The
  # button is drawn as a radio or a checkbutton, depending on the
  # `GtkCellRendererToggle:radio` property.
  # When activated, it emits the `GtkCellRendererToggle::toggled` signal.
  @[GObject::GeneratedWrapper]
  class CellRendererToggle < CellRenderer
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::CellRendererToggle), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, activatable : Bool? = nil, active : Bool? = nil, cell_background : ::String? = nil, cell_background_rgba : Gdk::RGBA? = nil, cell_background_set : Bool? = nil, editing : Bool? = nil, height : Int32? = nil, inconsistent : Bool? = nil, is_expanded : Bool? = nil, is_expander : Bool? = nil, mode : Gtk::CellRendererMode? = nil, radio : Bool? = nil, sensitive : Bool? = nil, visible : Bool? = nil, width : Int32? = nil, xalign : Float32? = nil, xpad : UInt32? = nil, yalign : Float32? = nil, ypad : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[19]
      _values = StaticArray(LibGObject::Value, 19).new(LibGObject::Value.new)
      _n = 0

      if !activatable.nil?
        (_names.to_unsafe + _n).value = "activatable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, activatable)
        _n += 1
      end
      if !active.nil?
        (_names.to_unsafe + _n).value = "active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, active)
        _n += 1
      end
      if !cell_background.nil?
        (_names.to_unsafe + _n).value = "cell-background".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_background)
        _n += 1
      end
      if !cell_background_rgba.nil?
        (_names.to_unsafe + _n).value = "cell-background-rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_background_rgba)
        _n += 1
      end
      if !cell_background_set.nil?
        (_names.to_unsafe + _n).value = "cell-background-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_background_set)
        _n += 1
      end
      if !editing.nil?
        (_names.to_unsafe + _n).value = "editing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editing)
        _n += 1
      end
      if !height.nil?
        (_names.to_unsafe + _n).value = "height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height)
        _n += 1
      end
      if !inconsistent.nil?
        (_names.to_unsafe + _n).value = "inconsistent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, inconsistent)
        _n += 1
      end
      if !is_expanded.nil?
        (_names.to_unsafe + _n).value = "is-expanded".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_expanded)
        _n += 1
      end
      if !is_expander.nil?
        (_names.to_unsafe + _n).value = "is-expander".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_expander)
        _n += 1
      end
      if !mode.nil?
        (_names.to_unsafe + _n).value = "mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mode)
        _n += 1
      end
      if !radio.nil?
        (_names.to_unsafe + _n).value = "radio".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, radio)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if !width.nil?
        (_names.to_unsafe + _n).value = "width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width)
        _n += 1
      end
      if !xalign.nil?
        (_names.to_unsafe + _n).value = "xalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xalign)
        _n += 1
      end
      if !xpad.nil?
        (_names.to_unsafe + _n).value = "xpad".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xpad)
        _n += 1
      end
      if !yalign.nil?
        (_names.to_unsafe + _n).value = "yalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, yalign)
        _n += 1
      end
      if !ypad.nil?
        (_names.to_unsafe + _n).value = "ypad".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ypad)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(CellRendererToggle.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_renderer_toggle_get_type
    end

    def activatable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "activatable", unsafe_value, Pointer(Void).null)
      value
    end

    def activatable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "activatable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def active=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "active", unsafe_value, Pointer(Void).null)
      value
    end

    def active? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "active", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def inconsistent=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "inconsistent", unsafe_value, Pointer(Void).null)
      value
    end

    def inconsistent? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "inconsistent", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def radio=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "radio", unsafe_value, Pointer(Void).null)
      value
    end

    def radio? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "radio", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new `GtkCellRendererToggle`. Adjust rendering
    # parameters using object properties. Object properties can be set
    # globally (with g_object_set()). Also, with `GtkTreeViewColumn`, you
    # can bind a property to a value in a `GtkTreeModel`. For example, you
    # can bind the “active” property on the cell renderer to a boolean value
    # in the model, thus causing the check button to reflect the state of
    # the model.
    def initialize
      # gtk_cell_renderer_toggle_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_renderer_toggle_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns whether the cell renderer is activatable. See
    # gtk_cell_renderer_toggle_set_activatable().
    def activatable : Bool
      # gtk_cell_renderer_toggle_get_activatable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_renderer_toggle_get_activatable(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the cell renderer is active. See
    # gtk_cell_renderer_toggle_set_active().
    def active : Bool
      # gtk_cell_renderer_toggle_get_active: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_renderer_toggle_get_active(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether we’re rendering radio toggles rather than checkboxes.
    def radio : Bool
      # gtk_cell_renderer_toggle_get_radio: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_renderer_toggle_get_radio(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Makes the cell renderer activatable.
    def activatable=(setting : Bool) : Nil
      # gtk_cell_renderer_toggle_set_activatable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_renderer_toggle_set_activatable(self, setting)

      # Return value handling
    end

    # Activates or deactivates a cell renderer.
    def active=(setting : Bool) : Nil
      # gtk_cell_renderer_toggle_set_active: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_renderer_toggle_set_active(self, setting)

      # Return value handling
    end

    # If @radio is %TRUE, the cell renderer renders a radio toggle
    # (i.e. a toggle in a group of mutually-exclusive toggles).
    # If %FALSE, it renders a check toggle (a standalone boolean option).
    # This can be set globally for the cell renderer, or changed just
    # before rendering each cell in the model (for `GtkTreeView`, you set
    # up a per-row setting using `GtkTreeViewColumn` to associate model
    # columns with cell renderer properties).
    def radio=(radio : Bool) : Nil
      # gtk_cell_renderer_toggle_set_radio: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_renderer_toggle_set_radio(self, radio)

      # Return value handling
    end

    # The ::toggled signal is emitted when the cell is toggled.
    #
    # It is the responsibility of the application to update the model
    # with the correct value to store at @path.  Often this is simply the
    # opposite of the value currently stored at @path.
    struct ToggledSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "toggled::#{@detail}" : "toggled"
      end

      def connect(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect(handler : Proc(::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          path = lib_path
          ::Box(Proc(::String, Nil)).unbox(_lib_box).call(path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          path = lib_path
          ::Box(Proc(::String, Nil)).unbox(_lib_box).call(path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::CellRendererToggle, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::CellRendererToggle.new(_lib_sender, GICrystal::Transfer::None)
          path = lib_path
          ::Box(Proc(Gtk::CellRendererToggle, ::String, Nil)).unbox(_lib_box).call(_sender, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::CellRendererToggle, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::CellRendererToggle.new(_lib_sender, GICrystal::Transfer::None)
          path = lib_path
          ::Box(Proc(Gtk::CellRendererToggle, ::String, Nil)).unbox(_lib_box).call(_sender, path)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(path : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "toggled", path)
      end
    end

    def toggled_signal
      ToggledSignal.new(self)
    end
  end
end

require "./cell_renderer"

module Gtk
  # Renders a pixbuf in a cell
  #
  # A `GtkCellRendererPixbuf` can be used to render an image in a cell. It allows
  # to render either a given `GdkPixbuf` (set via the
  # `GtkCellRendererPixbuf:pixbuf` property) or a named icon (set via the
  # `GtkCellRendererPixbuf:icon-name` property).
  #
  # To support the tree view, `GtkCellRendererPixbuf` also supports rendering two
  # alternative pixbufs, when the `GtkCellRenderer:is-expander` property is %TRUE.
  # If the `GtkCellRenderer:is-expanded property` is %TRUE and the
  # `GtkCellRendererPixbuf:pixbuf-expander-open` property is set to a pixbuf, it
  # renders that pixbuf, if the `GtkCellRenderer:is-expanded` property is %FALSE
  # and the `GtkCellRendererPixbuf:pixbuf-expander-closed` property is set to a
  # pixbuf, it renders that one.
  @[GObject::GeneratedWrapper]
  class CellRendererPixbuf < CellRenderer
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::CellRendererPixbuf), instance_init, 0)
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

    def initialize(*, cell_background : ::String? = nil, cell_background_rgba : Gdk::RGBA? = nil, cell_background_set : Bool? = nil, editing : Bool? = nil, gicon : Gio::Icon? = nil, height : Int32? = nil, icon_name : ::String? = nil, icon_size : Gtk::IconSize? = nil, is_expanded : Bool? = nil, is_expander : Bool? = nil, mode : Gtk::CellRendererMode? = nil, pixbuf : GdkPixbuf::Pixbuf? = nil, pixbuf_expander_closed : GdkPixbuf::Pixbuf? = nil, pixbuf_expander_open : GdkPixbuf::Pixbuf? = nil, sensitive : Bool? = nil, texture : Gdk::Texture? = nil, visible : Bool? = nil, width : Int32? = nil, xalign : Float32? = nil, xpad : UInt32? = nil, yalign : Float32? = nil, ypad : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[22]
      _values = StaticArray(LibGObject::Value, 22).new(LibGObject::Value.new)
      _n = 0

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
      if !gicon.nil?
        (_names.to_unsafe + _n).value = "gicon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gicon)
        _n += 1
      end
      if !height.nil?
        (_names.to_unsafe + _n).value = "height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height)
        _n += 1
      end
      if !icon_name.nil?
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
        _n += 1
      end
      if !icon_size.nil?
        (_names.to_unsafe + _n).value = "icon-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_size)
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
      if !pixbuf.nil?
        (_names.to_unsafe + _n).value = "pixbuf".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixbuf)
        _n += 1
      end
      if !pixbuf_expander_closed.nil?
        (_names.to_unsafe + _n).value = "pixbuf-expander-closed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixbuf_expander_closed)
        _n += 1
      end
      if !pixbuf_expander_open.nil?
        (_names.to_unsafe + _n).value = "pixbuf-expander-open".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixbuf_expander_open)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !texture.nil?
        (_names.to_unsafe + _n).value = "texture".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, texture)
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

      @pointer = LibGObject.g_object_new_with_properties(CellRendererPixbuf.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_renderer_pixbuf_get_type
    end

    def gicon=(value : Gio::Icon?) : Gio::Icon?
      unsafe_value = value

      LibGObject.g_object_set(self, "gicon", unsafe_value, Pointer(Void).null)
      value
    end

    def gicon : Gio::Icon?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "gicon", pointerof(value), Pointer(Void).null)
      Gio::Icon__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def icon_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "icon-name", unsafe_value, Pointer(Void).null)
      value
    end

    def icon_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "icon-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def icon_size=(value : Gtk::IconSize) : Gtk::IconSize
      unsafe_value = value

      LibGObject.g_object_set(self, "icon-size", unsafe_value, Pointer(Void).null)
      value
    end

    def icon_size : Gtk::IconSize
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "icon-size", pointerof(value), Pointer(Void).null)
      Gtk::IconSize.new(value)
    end

    def pixbuf=(value : GdkPixbuf::Pixbuf?) : GdkPixbuf::Pixbuf?
      unsafe_value = value

      LibGObject.g_object_set(self, "pixbuf", unsafe_value, Pointer(Void).null)
      value
    end

    def pixbuf_expander_closed=(value : GdkPixbuf::Pixbuf?) : GdkPixbuf::Pixbuf?
      unsafe_value = value

      LibGObject.g_object_set(self, "pixbuf-expander-closed", unsafe_value, Pointer(Void).null)
      value
    end

    def pixbuf_expander_closed : GdkPixbuf::Pixbuf?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "pixbuf-expander-closed", pointerof(value), Pointer(Void).null)
      GdkPixbuf::Pixbuf.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def pixbuf_expander_open=(value : GdkPixbuf::Pixbuf?) : GdkPixbuf::Pixbuf?
      unsafe_value = value

      LibGObject.g_object_set(self, "pixbuf-expander-open", unsafe_value, Pointer(Void).null)
      value
    end

    def pixbuf_expander_open : GdkPixbuf::Pixbuf?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "pixbuf-expander-open", pointerof(value), Pointer(Void).null)
      GdkPixbuf::Pixbuf.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def texture=(value : Gdk::Texture?) : Gdk::Texture?
      unsafe_value = value

      LibGObject.g_object_set(self, "texture", unsafe_value, Pointer(Void).null)
      value
    end

    def texture : Gdk::Texture?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "texture", pointerof(value), Pointer(Void).null)
      Gdk::Texture.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new `GtkCellRendererPixbuf`. Adjust rendering
    # parameters using object properties. Object properties can be set
    # globally (with g_object_set()). Also, with `GtkTreeViewColumn`, you
    # can bind a property to a value in a `GtkTreeModel`. For example, you
    # can bind the “pixbuf” property on the cell renderer to a pixbuf value
    # in the model, thus rendering a different image in each row of the
    # `GtkTreeView`.
    def initialize
      # gtk_cell_renderer_pixbuf_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_renderer_pixbuf_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end
  end
end

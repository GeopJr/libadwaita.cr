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
  class CellRendererPixbuf < CellRenderer
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, cell_background : ::String? = nil, cell_background_rgba : Gdk::RGBA? = nil, cell_background_set : Bool? = nil, editing : Bool? = nil, gicon : Gio::Icon? = nil, height : Int32? = nil, icon_name : ::String? = nil, icon_size : Gtk::IconSize? = nil, is_expanded : Bool? = nil, is_expander : Bool? = nil, mode : Gtk::CellRendererMode? = nil, pixbuf : GdkPixbuf::Pixbuf? = nil, pixbuf_expander_closed : GdkPixbuf::Pixbuf? = nil, pixbuf_expander_open : GdkPixbuf::Pixbuf? = nil, sensitive : Bool? = nil, texture : Gdk::Texture? = nil, visible : Bool? = nil, width : Int32? = nil, xalign : Float32? = nil, xpad : UInt32? = nil, yalign : Float32? = nil, ypad : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[22]
      _values = StaticArray(LibGObject::Value, 22).new(LibGObject::Value.new)
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
      if gicon
        (_names.to_unsafe + _n).value = "gicon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gicon)
        _n += 1
      end
      if height
        (_names.to_unsafe + _n).value = "height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height)
        _n += 1
      end
      if icon_name
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
        _n += 1
      end
      if icon_size
        (_names.to_unsafe + _n).value = "icon-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_size)
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
      if pixbuf
        (_names.to_unsafe + _n).value = "pixbuf".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixbuf)
        _n += 1
      end
      if pixbuf_expander_closed
        (_names.to_unsafe + _n).value = "pixbuf-expander-closed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixbuf_expander_closed)
        _n += 1
      end
      if pixbuf_expander_open
        (_names.to_unsafe + _n).value = "pixbuf-expander-open".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixbuf_expander_open)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if texture
        (_names.to_unsafe + _n).value = "texture".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, texture)
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

      @pointer = LibGObject.g_object_new_with_properties(CellRendererPixbuf.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_renderer_pixbuf_get_type
    end

    def initialize
      # gtk_cell_renderer_pixbuf_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_renderer_pixbuf_new
      @pointer = _retval
    end
  end
end

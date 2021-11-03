require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # `GtkBookmarkList` is a list model that wraps `GBookmarkFile`.
  #
  # It presents a `GListModel` and fills it asynchronously with the
  # `GFileInfo`s returned from that function.
  #
  # The `GFileInfo`s in the list have some attributes in the recent
  # namespace added: `recent::private` (boolean) and `recent:applications`
  # (stringv).
  class BookmarkList < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, attributes : ::String? = nil, filename : ::String? = nil, io_priority : Int32? = nil, loading : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if attributes
        (_names.to_unsafe + _n).value = "attributes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, attributes)
        _n += 1
      end
      if filename
        (_names.to_unsafe + _n).value = "filename".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, filename)
        _n += 1
      end
      if io_priority
        (_names.to_unsafe + _n).value = "io-priority".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, io_priority)
        _n += 1
      end
      if loading
        (_names.to_unsafe + _n).value = "loading".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, loading)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(BookmarkList.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_bookmark_list_get_type
    end

    def attributes=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "attributes", unsafe_value, Pointer(Void).null)
      value
    end

    def attributes : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "attributes", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def filename=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "filename", unsafe_value, Pointer(Void).null)
      value
    end

    def filename : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "filename", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def io_priority=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "io-priority", unsafe_value, Pointer(Void).null)
      value
    end

    def io_priority : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "io-priority", pointerof(value), Pointer(Void).null)
      value
    end

    def loading? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "loading", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def initialize(filename : ::String?, attributes : ::String?)
      # gtk_bookmark_list_new: (Constructor)
      # @filename: (nullable)
      # @attributes: (nullable)
      # Returns: (transfer full)

      filename = if filename.nil?
                   Pointer(LibC::Char).null
                 else
                   filename.to_unsafe
                 end
      attributes = if attributes.nil?
                     Pointer(LibC::Char).null
                   else
                     attributes.to_unsafe
                   end

      _retval = LibGtk.gtk_bookmark_list_new(filename, attributes)
      @pointer = _retval
    end

    def attributes : ::String?
      # gtk_bookmark_list_get_attributes: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bookmark_list_get_attributes(self)
      ::String.new(_retval) unless _retval.null?
    end

    def filename : ::Path
      # gtk_bookmark_list_get_filename: (Method | Getter)
      # Returns: (transfer none Filename)

      _retval = LibGtk.gtk_bookmark_list_get_filename(self)
      ::Path.new(::String.new(_retval))
    end

    def io_priority : Int32
      # gtk_bookmark_list_get_io_priority: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bookmark_list_get_io_priority(self)
      _retval
    end

    def is_loading : Bool
      # gtk_bookmark_list_is_loading: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bookmark_list_is_loading(self)
      GICrystal.to_bool(_retval)
    end

    def attributes=(attributes : ::String?) : Nil
      # gtk_bookmark_list_set_attributes: (Method | Setter)
      # @attributes: (nullable)
      # Returns: (transfer none)

      attributes = if attributes.nil?
                     Pointer(LibC::Char).null
                   else
                     attributes.to_unsafe
                   end

      LibGtk.gtk_bookmark_list_set_attributes(self, attributes)
    end

    def io_priority=(io_priority : Int32) : Nil
      # gtk_bookmark_list_set_io_priority: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_bookmark_list_set_io_priority(self, io_priority)
    end
  end
end

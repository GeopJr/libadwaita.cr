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
  @[GObject::GeneratedWrapper]
  class BookmarkList < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::BookmarkListClass), class_init,
        sizeof(LibGtk::BookmarkList), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, attributes : ::String? = nil, filename : ::String? = nil, io_priority : Int32? = nil, loading : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !attributes.nil?
        (_names.to_unsafe + _n).value = "attributes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, attributes)
        _n += 1
      end
      if !filename.nil?
        (_names.to_unsafe + _n).value = "filename".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, filename)
        _n += 1
      end
      if !io_priority.nil?
        (_names.to_unsafe + _n).value = "io-priority".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, io_priority)
        _n += 1
      end
      if !loading.nil?
        (_names.to_unsafe + _n).value = "loading".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, loading)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(BookmarkList.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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

    # Creates a new `GtkBookmarkList` with the given @attributes.
    def initialize(filename : ::String?, attributes : ::String?)
      # gtk_bookmark_list_new: (Constructor)
      # @filename: (nullable)
      # @attributes: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      filename = if filename.nil?
                   Pointer(LibC::Char).null
                 else
                   filename.to_unsafe
                 end

      # Generator::NullableArrayPlan
      attributes = if attributes.nil?
                     Pointer(LibC::Char).null
                   else
                     attributes.to_unsafe
                   end

      # C call
      _retval = LibGtk.gtk_bookmark_list_new(filename, attributes)

      # Return value handling

      @pointer = _retval
    end

    # Gets the attributes queried on the children.
    def attributes : ::String?
      # gtk_bookmark_list_get_attributes: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_bookmark_list_get_attributes(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the filename of the bookmark file that
    # this list is loading.
    def filename : ::Path
      # gtk_bookmark_list_get_filename: (Method | Getter)
      # Returns: (transfer none Filename)

      # C call
      _retval = LibGtk.gtk_bookmark_list_get_filename(self)

      # Return value handling

      ::Path.new(::String.new(_retval))
    end

    # Gets the IO priority to use while loading file.
    def io_priority : Int32
      # gtk_bookmark_list_get_io_priority: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_bookmark_list_get_io_priority(self)

      # Return value handling

      _retval
    end

    # Returns %TRUE if the files are currently being loaded.
    #
    # Files will be added to @self from time to time while loading is
    # going on. The order in which are added is undefined and may change
    # in between runs.
    def is_loading : Bool
      # gtk_bookmark_list_is_loading: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_bookmark_list_is_loading(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the @attributes to be enumerated and starts the enumeration.
    #
    # If @attributes is %NULL, no attributes will be queried, but a list
    # of `GFileInfo`s will still be created.
    def attributes=(attributes : ::String?) : Nil
      # gtk_bookmark_list_set_attributes: (Method | Setter)
      # @attributes: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      attributes = if attributes.nil?
                     Pointer(LibC::Char).null
                   else
                     attributes.to_unsafe
                   end

      # C call
      LibGtk.gtk_bookmark_list_set_attributes(self, attributes)

      # Return value handling
    end

    # Sets the IO priority to use while loading files.
    #
    # The default IO priority is %G_PRIORITY_DEFAULT.
    def io_priority=(io_priority : Int32) : Nil
      # gtk_bookmark_list_set_io_priority: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_bookmark_list_set_io_priority(self, io_priority)

      # Return value handling
    end
  end
end

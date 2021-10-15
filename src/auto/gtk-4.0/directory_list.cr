require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # `GtkDirectoryList` is a list model that wraps g_file_enumerate_children_async().
  #
  # It presents a `GListModel` and fills it asynchronously with the `GFileInfo`s
  # returned from that function.
  #
  # Enumeration will start automatically when a the
  # [property@Gtk.DirectoryList:file] property is set.
  #
  # While the `GtkDirectoryList` is being filled, the
  # [property@Gtk.DirectoryList:loading] property will be set to %TRUE. You can
  # listen to that property if you want to show information like a `GtkSpinner`
  # or a "Loading..." text.
  #
  # If loading fails at any point, the [property@Gtk.DirectoryList:error]
  # property will be set to give more indication about the failure.
  #
  # The `GFileInfo`s returned from a `GtkDirectoryList` have the "standard::file"
  # attribute set to the `GFile` they refer to. This way you can get at the file
  # that is referred to in the same way you would via g_file_enumerator_get_child().
  # This means you do not need access to the `GtkDirectoryList`, but can access
  # the `GFile` directly from the `GFileInfo` when operating with a `GtkListView`
  # or similar.
  class DirectoryList < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, attributes : ::String? = nil, error : GLib::Error? = nil, file : Gio::File? = nil, io_priority : Int32? = nil, loading : Bool? = nil, monitored : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if attributes
        (_names.to_unsafe + _n).value = "attributes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, attributes)
        _n += 1
      end
      if error
        (_names.to_unsafe + _n).value = "error".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, error)
        _n += 1
      end
      if file
        (_names.to_unsafe + _n).value = "file".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, file)
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
      if monitored
        (_names.to_unsafe + _n).value = "monitored".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, monitored)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DirectoryList.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_directory_list_get_type
    end

    def initialize(attributes : ::String?, file : Gio::File?)
      # gtk_directory_list_new: (Constructor)
      # @attributes: (nullable)
      # @file: (nullable)
      # Returns: (transfer full)

      attributes = if attributes.nil?
                     Pointer(LibC::Char).null
                   else
                     attributes.to_unsafe
                   end
      file = if file.nil?
               Pointer(Void).null
             else
               file.to_unsafe
             end

      _retval = LibGtk.gtk_directory_list_new(attributes, file)
      @pointer = _retval
    end

    def attributes : ::String?
      # gtk_directory_list_get_attributes: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_directory_list_get_attributes(self)
      ::String.new(_retval) unless _retval.null?
    end

    def error : GLib::Error?
      # gtk_directory_list_get_error: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_directory_list_get_error(self)
      GLib::Error.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def file : Gio::File?
      # gtk_directory_list_get_file: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_directory_list_get_file(self)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def io_priority : Int32
      # gtk_directory_list_get_io_priority: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_directory_list_get_io_priority(self)
      _retval
    end

    def monitored? : Bool
      # gtk_directory_list_get_monitored: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_directory_list_get_monitored(self)
      GICrystal.to_bool(_retval)
    end

    def is_loading : Bool
      # gtk_directory_list_is_loading: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_directory_list_is_loading(self)
      GICrystal.to_bool(_retval)
    end

    def attributes=(attributes : ::String?) : Nil
      # gtk_directory_list_set_attributes: (Method)
      # @attributes: (nullable)
      # Returns: (transfer none)

      attributes = if attributes.nil?
                     Pointer(LibC::Char).null
                   else
                     attributes.to_unsafe
                   end

      LibGtk.gtk_directory_list_set_attributes(self, attributes)
    end

    def file=(file : Gio::File?) : Nil
      # gtk_directory_list_set_file: (Method)
      # @file: (nullable)
      # Returns: (transfer none)

      file = if file.nil?
               Pointer(Void).null
             else
               file.to_unsafe
             end

      LibGtk.gtk_directory_list_set_file(self, file)
    end

    def io_priority=(io_priority : Int32) : Nil
      # gtk_directory_list_set_io_priority: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_directory_list_set_io_priority(self, io_priority)
    end

    def monitored=(monitored : Bool) : Nil
      # gtk_directory_list_set_monitored: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_directory_list_set_monitored(self, monitored)
    end
  end
end

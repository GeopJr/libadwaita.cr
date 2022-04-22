require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Gtk
  # `GtkDirectoryList` is a list model that wraps g_file_enumerate_children_async().
  #
  # It presents a `GListModel` and fills it asynchronously with the `GFileInfo`s
  # returned from that function.
  #
  # Enumeration will start automatically when a the
  # `Gtk::DirectoryList#file` property is set.
  #
  # While the `GtkDirectoryList` is being filled, the
  # `Gtk::DirectoryList#loading` property will be set to %TRUE. You can
  # listen to that property if you want to show information like a `GtkSpinner`
  # or a "Loading..." text.
  #
  # If loading fails at any point, the `Gtk::DirectoryList#error`
  # property will be set to give more indication about the failure.
  #
  # The `GFileInfo`s returned from a `GtkDirectoryList` have the "standard::file"
  # attribute set to the `GFile` they refer to. This way you can get at the file
  # that is referred to in the same way you would via g_file_enumerator_get_child().
  # This means you do not need access to the `GtkDirectoryList`, but can access
  # the `GFile` directly from the `GFileInfo` when operating with a `GtkListView`
  # or similar.
  @[GObject::GeneratedWrapper]
  class DirectoryList < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::DirectoryListClass), class_init,
        sizeof(LibGtk::DirectoryList), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, attributes : ::String? = nil, error : GLib::Error? = nil, file : Gio::File? = nil, io_priority : Int32? = nil, loading : Bool? = nil, monitored : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if !attributes.nil?
        (_names.to_unsafe + _n).value = "attributes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, attributes)
        _n += 1
      end
      if !error.nil?
        (_names.to_unsafe + _n).value = "error".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, error)
        _n += 1
      end
      if !file.nil?
        (_names.to_unsafe + _n).value = "file".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, file)
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
      if !monitored.nil?
        (_names.to_unsafe + _n).value = "monitored".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, monitored)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DirectoryList.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_directory_list_get_type
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

    def error : GLib::Error
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "error", pointerof(value), Pointer(Void).null)
      GLib::Error.new(value, GICrystal::Transfer::None)
    end

    def file=(value : Gio::File?) : Gio::File?
      unsafe_value = value

      LibGObject.g_object_set(self, "file", unsafe_value, Pointer(Void).null)
      value
    end

    def file : Gio::File?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "file", pointerof(value), Pointer(Void).null)
      Gio::File__Impl.new(value, GICrystal::Transfer::None) unless value.null?
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

    def monitored=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "monitored", unsafe_value, Pointer(Void).null)
      value
    end

    def monitored? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "monitored", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new `GtkDirectoryList`.
    #
    # The `GtkDirectoryList` is querying the given @file
    # with the given @attributes.
    def initialize(attributes : ::String?, file : Gio::File?)
      # gtk_directory_list_new: (Constructor)
      # @attributes: (nullable)
      # @file: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      attributes = if attributes.nil?
                     Pointer(LibC::Char).null
                   else
                     attributes.to_unsafe
                   end

      # Generator::NullableArrayPlan
      file = if file.nil?
               Pointer(Void).null
             else
               file.to_unsafe
             end

      # C call
      _retval = LibGtk.gtk_directory_list_new(attributes, file)

      # Return value handling

      @pointer = _retval
    end

    # Gets the attributes queried on the children.
    def attributes : ::String?
      # gtk_directory_list_get_attributes: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_directory_list_get_attributes(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the loading error, if any.
    #
    # If an error occurs during the loading process, the loading process
    # will finish and this property allows querying the error that happened.
    # This error will persist until a file is loaded again.
    #
    # An error being set does not mean that no files were loaded, and all
    # successfully queried files will remain in the list.
    def error : GLib::Error?
      # gtk_directory_list_get_error: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_directory_list_get_error(self)

      # Return value handling

      GLib::Error.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the file whose children are currently enumerated.
    def file : Gio::File?
      # gtk_directory_list_get_file: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_directory_list_get_file(self)

      # Return value handling

      Gio::File__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the IO priority set via gtk_directory_list_set_io_priority().
    def io_priority : Int32
      # gtk_directory_list_get_io_priority: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_directory_list_get_io_priority(self)

      # Return value handling

      _retval
    end

    # Returns whether the directory list is monitoring
    # the directory for changes.
    def monitored : Bool
      # gtk_directory_list_get_monitored: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_directory_list_get_monitored(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns %TRUE if the children enumeration is currently in
    # progress.
    #
    # Files will be added to @self from time to time while loading is
    # going on. The order in which are added is undefined and may change
    # in between runs.
    def is_loading : Bool
      # gtk_directory_list_is_loading: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_directory_list_is_loading(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the @attributes to be enumerated and starts the enumeration.
    #
    # If @attributes is %NULL, no attributes will be queried, but a list
    # of `GFileInfo`s will still be created.
    def attributes=(attributes : ::String?) : Nil
      # gtk_directory_list_set_attributes: (Method | Setter)
      # @attributes: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      attributes = if attributes.nil?
                     Pointer(LibC::Char).null
                   else
                     attributes.to_unsafe
                   end

      # C call
      LibGtk.gtk_directory_list_set_attributes(self, attributes)

      # Return value handling
    end

    # Sets the @file to be enumerated and starts the enumeration.
    #
    # If @file is %NULL, the result will be an empty list.
    def file=(file : Gio::File?) : Nil
      # gtk_directory_list_set_file: (Method | Setter)
      # @file: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      file = if file.nil?
               Pointer(Void).null
             else
               file.to_unsafe
             end

      # C call
      LibGtk.gtk_directory_list_set_file(self, file)

      # Return value handling
    end

    # Sets the IO priority to use while loading directories.
    #
    # Setting the priority while @self is loading will reprioritize the
    # ongoing load as soon as possible.
    #
    # The default IO priority is %G_PRIORITY_DEFAULT, which is higher than
    # the GTK redraw priority. If you are loading a lot of directories in
    # parallel, lowering it to something like %G_PRIORITY_DEFAULT_IDLE
    # may increase responsiveness.
    def io_priority=(io_priority : Int32) : Nil
      # gtk_directory_list_set_io_priority: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_directory_list_set_io_priority(self, io_priority)

      # Return value handling
    end

    # Sets whether the directory list will monitor the directory
    # for changes.
    #
    # If monitoring is enabled, the ::items-changed signal will
    # be emitted when the directory contents change.
    #
    #
    # When monitoring is turned on after the initial creation
    # of the directory list, the directory is reloaded to avoid
    # missing files that appeared between the initial loading
    # and when monitoring was turned on.
    def monitored=(monitored : Bool) : Nil
      # gtk_directory_list_set_monitored: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_directory_list_set_monitored(self, monitored)

      # Return value handling
    end
  end
end

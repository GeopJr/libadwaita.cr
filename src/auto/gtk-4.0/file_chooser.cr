module Gtk
  # `GtkFileChooser` is an interface that can be implemented by file
  # selection widgets.
  #
  # In GTK, the main objects that implement this interface are
  # [class@Gtk.FileChooserWidget] and [class@Gtk.FileChooserDialog].
  #
  # You do not need to write an object that implements the `GtkFileChooser`
  # interface unless you are trying to adapt an existing file selector to
  # expose a standard programming interface.
  #
  # `GtkFileChooser` allows for shortcuts to various places in the filesystem.
  # In the default implementation these are displayed in the left pane. It
  # may be a bit confusing at first that these shortcuts come from various
  # sources and in various flavours, so lets explain the terminology here:
  #
  # - Bookmarks: are created by the user, by dragging folders from the
  #   right pane to the left pane, or by using the “Add”. Bookmarks
  #   can be renamed and deleted by the user.
  #
  # - Shortcuts: can be provided by the application. For example, a Paint
  #   program may want to add a shortcut for a Clipart folder. Shortcuts
  #   cannot be modified by the user.
  #
  # - Volumes: are provided by the underlying filesystem abstraction. They are
  #   the “roots” of the filesystem.
  #
  # # File Names and Encodings
  #
  # When the user is finished selecting files in a `GtkFileChooser`, your
  # program can get the selected filenames as `GFile`s.
  #
  # # Adding options
  #
  # You can add extra widgets to a file chooser to provide options
  # that are not present in the default design, by using
  # [method@Gtk.FileChooser.add_choice]. Each choice has an identifier and
  # a user visible label; additionally, each choice can have multiple
  # options. If a choice has no option, it will be rendered as a
  # check button with the given label; if a choice has options, it will
  # be rendered as a combo box.
  module FileChooser
    def action=(value : Gtk::FileChooserAction) : Gtk::FileChooserAction
      unsafe_value = value

      LibGObject.g_object_set(self, "action", unsafe_value, Pointer(Void).null)
      value
    end

    def action : Gtk::FileChooserAction
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "action", pointerof(value), Pointer(Void).null)
      Gtk::FileChooserAction.from_value(value)
    end

    def create_folders=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "create-folders", unsafe_value, Pointer(Void).null)
      value
    end

    def create_folders? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "create-folders", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def filter=(value : Gtk::FileFilter?) : Gtk::FileFilter?
      unsafe_value = value

      LibGObject.g_object_set(self, "filter", unsafe_value, Pointer(Void).null)
      value
    end

    def filter : Gtk::FileFilter?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "filter", pointerof(value), Pointer(Void).null)
      Gtk::FileFilter.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def filters : Gio::ListModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "filters", pointerof(value), Pointer(Void).null)
      Gio::ListModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def select_multiple=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "select-multiple", unsafe_value, Pointer(Void).null)
      value
    end

    def select_multiple? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "select-multiple", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def shortcut_folders : Gio::ListModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "shortcut-folders", pointerof(value), Pointer(Void).null)
      Gio::ListModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def add_choice(id : ::String, label : ::String, options : Enumerable(::String)?, option_labels : Enumerable(::String)?) : Nil
      # gtk_file_chooser_add_choice: (Method)
      # @options: (nullable) (array zero-terminated=1 element-type Utf8)
      # @option_labels: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      options = if options.nil?
                  Pointer(Pointer(LibC::Char)).null
                else
                  options.to_a.map(&.to_unsafe).to_unsafe
                end
      option_labels = if option_labels.nil?
                        Pointer(Pointer(LibC::Char)).null
                      else
                        option_labels.to_a.map(&.to_unsafe).to_unsafe
                      end

      LibGtk.gtk_file_chooser_add_choice(self, id, label, options, option_labels)
    end

    def add_filter(filter : Gtk::FileFilter) : Nil
      # gtk_file_chooser_add_filter: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_file_chooser_add_filter(self, filter)
    end

    def add_shortcut_folder(folder : Gio::File) : Bool
      # gtk_file_chooser_add_shortcut_folder: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_file_chooser_add_shortcut_folder(self, folder)
      GICrystal.to_bool(_retval)
    end

    def action : Gtk::FileChooserAction
      # gtk_file_chooser_get_action: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_file_chooser_get_action(self)
      Gtk::FileChooserAction.from_value(_retval)
    end

    def choice(id : ::String) : ::String
      # gtk_file_chooser_get_choice: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_file_chooser_get_choice(self, id)
      ::String.new(_retval)
    end

    def create_folders : Bool
      # gtk_file_chooser_get_create_folders: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_file_chooser_get_create_folders(self)
      GICrystal.to_bool(_retval)
    end

    def current_folder : Gio::File
      # gtk_file_chooser_get_current_folder: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_file_chooser_get_current_folder(self)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def current_name : ::String
      # gtk_file_chooser_get_current_name: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_file_chooser_get_current_name(self)
      GICrystal.transfer_full(_retval)
    end

    def file : Gio::File
      # gtk_file_chooser_get_file: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_file_chooser_get_file(self)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def files : Gio::ListModel
      # gtk_file_chooser_get_files: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_file_chooser_get_files(self)
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def filter : Gtk::FileFilter?
      # gtk_file_chooser_get_filter: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_file_chooser_get_filter(self)
      Gtk::FileFilter.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def filters : Gio::ListModel
      # gtk_file_chooser_get_filters: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_file_chooser_get_filters(self)
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def select_multiple : Bool
      # gtk_file_chooser_get_select_multiple: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_file_chooser_get_select_multiple(self)
      GICrystal.to_bool(_retval)
    end

    def shortcut_folders : Gio::ListModel
      # gtk_file_chooser_get_shortcut_folders: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_file_chooser_get_shortcut_folders(self)
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def remove_choice(id : ::String) : Nil
      # gtk_file_chooser_remove_choice: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_file_chooser_remove_choice(self, id)
    end

    def remove_filter(filter : Gtk::FileFilter) : Nil
      # gtk_file_chooser_remove_filter: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_file_chooser_remove_filter(self, filter)
    end

    def remove_shortcut_folder(folder : Gio::File) : Bool
      # gtk_file_chooser_remove_shortcut_folder: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_file_chooser_remove_shortcut_folder(self, folder)
      GICrystal.to_bool(_retval)
    end

    def action=(action : Gtk::FileChooserAction) : Nil
      # gtk_file_chooser_set_action: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_file_chooser_set_action(self, action)
    end

    def set_choice(id : ::String, option : ::String) : Nil
      # gtk_file_chooser_set_choice: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_file_chooser_set_choice(self, id, option)
    end

    def create_folders=(create_folders : Bool) : Nil
      # gtk_file_chooser_set_create_folders: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_file_chooser_set_create_folders(self, create_folders)
    end

    def current_folder=(file : Gio::File) : Bool
      # gtk_file_chooser_set_current_folder: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_file_chooser_set_current_folder(self, file)
      GICrystal.to_bool(_retval)
    end

    def current_name=(name : ::String) : Nil
      # gtk_file_chooser_set_current_name: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_file_chooser_set_current_name(self, name)
    end

    def file=(file : Gio::File) : Bool
      # gtk_file_chooser_set_file: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_file_chooser_set_file(self, file)
      GICrystal.to_bool(_retval)
    end

    def filter=(filter : Gtk::FileFilter) : Nil
      # gtk_file_chooser_set_filter: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_file_chooser_set_filter(self, filter)
    end

    def select_multiple=(select_multiple : Bool) : Nil
      # gtk_file_chooser_set_select_multiple: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_file_chooser_set_select_multiple(self, select_multiple)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class FileChooser__Impl
    include FileChooser

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_file_chooser_get_type
    end

    # Cast a `GObject::Object` to `FileChooser`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to FileChooser")
    end

    # Cast a `GObject::Object` to `FileChooser`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end

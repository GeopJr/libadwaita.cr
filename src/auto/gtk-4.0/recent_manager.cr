require "../g_object-2.0/object"

module Gtk
  # `GtkRecentManager` manages and looks up recently used files.
  #
  # Each recently used file is identified by its URI, and has meta-data
  # associated to it, like the names and command lines of the applications
  # that have registered it, the number of time each application has
  # registered the same file, the mime type of the file and whether
  # the file should be displayed only by the applications that have
  # registered it.
  #
  # The recently used files list is per user.
  #
  # `GtkRecentManager` acts like a database of all the recently
  # used files. You can create new `GtkRecentManager` objects, but
  # it is more efficient to use the default manager created by GTK.
  #
  # Adding a new recently used file is as simple as:
  #
  # ```c
  # GtkRecentManager *manager;
  #
  # manager = gtk_recent_manager_get_default ();
  # gtk_recent_manager_add_item (manager, file_uri);
  # ```
  #
  # The `GtkRecentManager` will try to gather all the needed information
  # from the file itself through GIO.
  #
  # Looking up the meta-data associated with a recently used file
  # given its URI requires calling [method@Gtk.RecentManager.lookup_item]:
  #
  # ```c
  # GtkRecentManager *manager;
  # GtkRecentInfo *info;
  # GError *error = NULL;
  #
  # manager = gtk_recent_manager_get_default ();
  # info = gtk_recent_manager_lookup_item (manager, file_uri, &error);
  # if (error)
  #   {
  #     g_warning ("Could not find the file: %s", error->message);
  #     g_error_free (error);
  #   }
  # else
  #  {
  #    // Use the info object
  #    gtk_recent_info_unref (info);
  #  }
  # ```
  #
  # In order to retrieve the list of recently used files, you can use
  # [method@Gtk.RecentManager.get_items], which returns a list of
  # [struct@Gtk.RecentInfo].
  #
  # Note that the maximum age of the recently used files list is
  # controllable through the [property@Gtk.Settings:gtk-recent-files-max-age]
  # property.
  class RecentManager < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, filename : ::String? = nil, size : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if filename
        (_names.to_unsafe + _n).value = "filename".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, filename)
        _n += 1
      end
      if size
        (_names.to_unsafe + _n).value = "size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, size)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(RecentManager.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_recent_manager_get_type
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

    def size : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "size", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize
      # gtk_recent_manager_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_recent_manager_new
      @pointer = _retval
    end

    def self.default : Gtk::RecentManager
      # gtk_recent_manager_get_default: (None)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_manager_get_default
      Gtk::RecentManager.new(_retval, GICrystal::Transfer::None)
    end

    def add_full(uri : ::String, recent_data : Gtk::RecentData) : Bool
      # gtk_recent_manager_add_full: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_manager_add_full(self, uri, recent_data)
      GICrystal.to_bool(_retval)
    end

    def add_item(uri : ::String) : Bool
      # gtk_recent_manager_add_item: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_manager_add_item(self, uri)
      GICrystal.to_bool(_retval)
    end

    def items : GLib::List
      # gtk_recent_manager_get_items: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_recent_manager_get_items(self)
      GLib::List(Gtk::RecentInfo).new(_retval, GICrystal::Transfer::Full)
    end

    def has_item(uri : ::String) : Bool
      # gtk_recent_manager_has_item: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_manager_has_item(self, uri)
      GICrystal.to_bool(_retval)
    end

    def lookup_item(uri : ::String) : Gtk::RecentInfo?
      # gtk_recent_manager_lookup_item: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_recent_manager_lookup_item(self, uri)
      Gtk::RecentInfo.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def move_item(uri : ::String, new_uri : ::String?) : Bool
      # gtk_recent_manager_move_item: (Method | Throws)
      # @new_uri: (nullable)
      # Returns: (transfer none)

      new_uri = if new_uri.nil?
                  Pointer(LibC::Char).null
                else
                  new_uri.to_unsafe
                end

      _retval = LibGtk.gtk_recent_manager_move_item(self, uri, new_uri)
      GICrystal.to_bool(_retval)
    end

    def purge_items : Int32
      # gtk_recent_manager_purge_items: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_manager_purge_items(self)
      _retval
    end

    def remove_item(uri : ::String) : Bool
      # gtk_recent_manager_remove_item: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_manager_remove_item(self, uri)
      GICrystal.to_bool(_retval)
    end

    struct ChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "changed::#{@detail}" : "changed"
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

      def connect(block : Proc(Gtk::RecentManager, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::RecentManager.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::RecentManager, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::RecentManager, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::RecentManager.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::RecentManager, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end
  end
end

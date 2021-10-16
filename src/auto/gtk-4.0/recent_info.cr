module Gtk
  # `GtkRecentInfo` contains the metadata associated with an item in the
  # recently used files list.
  class RecentInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(RecentInfo.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(RecentInfo.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_recent_info_get_type
    end

    def create_app_info(app_name : ::String?) : Gio::AppInfo?
      # gtk_recent_info_create_app_info: (Method | Throws)
      # @app_name: (nullable)
      # Returns: (transfer full)

      app_name = if app_name.nil?
                   Pointer(LibC::Char).null
                 else
                   app_name.to_unsafe
                 end

      _retval = LibGtk.gtk_recent_info_create_app_info(self, app_name)
      Gio::AppInfo__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def exists : Bool
      # gtk_recent_info_exists: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_info_exists(self)
      GICrystal.to_bool(_retval)
    end

    def added : GLib::DateTime
      # gtk_recent_info_get_added: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_info_get_added(self)
      GLib::DateTime.new(_retval, GICrystal::Transfer::None)
    end

    def age : Int32
      # gtk_recent_info_get_age: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_info_get_age(self)
      _retval
    end

    def application_info(app_name : ::String, app_exec : ::String, count : UInt32, stamp : GLib::DateTime) : Bool
      # gtk_recent_info_get_application_info: (Method)
      # @app_exec: (out)
      # @count: (out) (transfer full)
      # @stamp: (out)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_info_get_application_info(self, app_name, app_exec, count, stamp)
      GICrystal.to_bool(_retval)
    end

    def applications : Enumerable(::String)
      # gtk_recent_info_get_applications: (Method)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full)

      length = Pointer(UInt64).null

      _retval = LibGtk.gtk_recent_info_get_applications(self, length)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def description : ::String
      # gtk_recent_info_get_description: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_info_get_description(self)
      ::String.new(_retval)
    end

    def display_name : ::String
      # gtk_recent_info_get_display_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_info_get_display_name(self)
      ::String.new(_retval)
    end

    def gicon : Gio::Icon?
      # gtk_recent_info_get_gicon: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_recent_info_get_gicon(self)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def groups : Enumerable(::String)
      # gtk_recent_info_get_groups: (Method)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full)

      length = Pointer(UInt64).null

      _retval = LibGtk.gtk_recent_info_get_groups(self, length)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def mime_type : ::String
      # gtk_recent_info_get_mime_type: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_info_get_mime_type(self)
      ::String.new(_retval)
    end

    def modified : GLib::DateTime
      # gtk_recent_info_get_modified: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_info_get_modified(self)
      GLib::DateTime.new(_retval, GICrystal::Transfer::None)
    end

    def private_hint : Bool
      # gtk_recent_info_get_private_hint: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_info_get_private_hint(self)
      GICrystal.to_bool(_retval)
    end

    def short_name : ::String
      # gtk_recent_info_get_short_name: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_recent_info_get_short_name(self)
      GICrystal.transfer_full(_retval)
    end

    def uri : ::String
      # gtk_recent_info_get_uri: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_info_get_uri(self)
      ::String.new(_retval)
    end

    def uri_display : ::String?
      # gtk_recent_info_get_uri_display: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_recent_info_get_uri_display(self)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def visited : GLib::DateTime
      # gtk_recent_info_get_visited: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_info_get_visited(self)
      GLib::DateTime.new(_retval, GICrystal::Transfer::None)
    end

    def has_application(app_name : ::String) : Bool
      # gtk_recent_info_has_application: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_info_has_application(self, app_name)
      GICrystal.to_bool(_retval)
    end

    def has_group(group_name : ::String) : Bool
      # gtk_recent_info_has_group: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_info_has_group(self, group_name)
      GICrystal.to_bool(_retval)
    end

    def is_local : Bool
      # gtk_recent_info_is_local: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_info_is_local(self)
      GICrystal.to_bool(_retval)
    end

    def last_application : ::String
      # gtk_recent_info_last_application: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_recent_info_last_application(self)
      GICrystal.transfer_full(_retval)
    end

    def match(info_b : Gtk::RecentInfo) : Bool
      # gtk_recent_info_match: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_recent_info_match(self, info_b)
      GICrystal.to_bool(_retval)
    end

    def ref : Gtk::RecentInfo
      # gtk_recent_info_ref: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_recent_info_ref(self)
      Gtk::RecentInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # gtk_recent_info_unref: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_recent_info_unref(self)
    end

    def to_unsafe
      @pointer
    end
  end
end

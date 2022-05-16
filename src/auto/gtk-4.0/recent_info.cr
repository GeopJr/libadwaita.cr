module Gtk
  # `GtkRecentInfo` contains the metadata associated with an item in the
  # recently used files list.
  class RecentInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(RecentInfo.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(RecentInfo.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGtk::RecentInfo)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_recent_info_get_type
    end

    def create_app_info(app_name : ::String?) : Gio::AppInfo?
      # gtk_recent_info_create_app_info: (Method | Throws)
      # @app_name: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      app_name = if app_name.nil?
                   Pointer(LibC::Char).null
                 else
                   app_name.to_unsafe
                 end

      # C call
      _retval = LibGtk.gtk_recent_info_create_app_info(@pointer, app_name, pointerof(_error))

      # Error check
      Gtk.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::AbstractAppInfo.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def exists : Bool
      # gtk_recent_info_exists: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_recent_info_exists(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def added : GLib::DateTime
      # gtk_recent_info_get_added: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_recent_info_get_added(@pointer)

      # Return value handling

      GLib::DateTime.new(_retval, GICrystal::Transfer::None)
    end

    def age : Int32
      # gtk_recent_info_get_age: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_recent_info_get_age(@pointer)

      # Return value handling

      _retval
    end

    def application_info(app_name : ::String, app_exec : ::String, count : UInt32, stamp : GLib::DateTime) : Bool
      # gtk_recent_info_get_application_info: (Method)
      # @app_exec: (out)
      # @count: (out) (transfer full)
      # @stamp: (out)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_recent_info_get_application_info(@pointer, app_name, app_exec, count, stamp)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def applications : Enumerable(::String)
      # gtk_recent_info_get_applications: (Method)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full) (array length=length zero-terminated=1 element-type Utf8)

      # Generator::OutArgUsedInReturnPlan
      length = 0_u64
      # C call
      _retval = LibGtk.gtk_recent_info_get_applications(@pointer, pointerof(length))

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def description : ::String
      # gtk_recent_info_get_description: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_recent_info_get_description(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    def display_name : ::String
      # gtk_recent_info_get_display_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_recent_info_get_display_name(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    def gicon : Gio::Icon?
      # gtk_recent_info_get_gicon: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_recent_info_get_gicon(@pointer)

      # Return value handling

      Gio::AbstractIcon.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def groups : Enumerable(::String)
      # gtk_recent_info_get_groups: (Method)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full) (array length=length zero-terminated=1 element-type Utf8)

      # Generator::OutArgUsedInReturnPlan
      length = 0_u64
      # C call
      _retval = LibGtk.gtk_recent_info_get_groups(@pointer, pointerof(length))

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def mime_type : ::String
      # gtk_recent_info_get_mime_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_recent_info_get_mime_type(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    def modified : GLib::DateTime
      # gtk_recent_info_get_modified: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_recent_info_get_modified(@pointer)

      # Return value handling

      GLib::DateTime.new(_retval, GICrystal::Transfer::None)
    end

    def private_hint : Bool
      # gtk_recent_info_get_private_hint: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_recent_info_get_private_hint(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def short_name : ::String
      # gtk_recent_info_get_short_name: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_recent_info_get_short_name(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def uri : ::String
      # gtk_recent_info_get_uri: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_recent_info_get_uri(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    def uri_display : ::String?
      # gtk_recent_info_get_uri_display: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_recent_info_get_uri_display(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def visited : GLib::DateTime
      # gtk_recent_info_get_visited: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_recent_info_get_visited(@pointer)

      # Return value handling

      GLib::DateTime.new(_retval, GICrystal::Transfer::None)
    end

    def has_application(app_name : ::String) : Bool
      # gtk_recent_info_has_application: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_recent_info_has_application(@pointer, app_name)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def has_group(group_name : ::String) : Bool
      # gtk_recent_info_has_group: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_recent_info_has_group(@pointer, group_name)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_local : Bool
      # gtk_recent_info_is_local: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_recent_info_is_local(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def last_application : ::String
      # gtk_recent_info_last_application: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_recent_info_last_application(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def match(info_b : Gtk::RecentInfo) : Bool
      # gtk_recent_info_match: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_recent_info_match(@pointer, info_b)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def ref : Gtk::RecentInfo
      # gtk_recent_info_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_recent_info_ref(@pointer)

      # Return value handling

      Gtk::RecentInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # gtk_recent_info_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_recent_info_unref(@pointer)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end

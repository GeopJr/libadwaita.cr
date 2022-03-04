require "../g_object-2.0/object"

module Gio
  # #GFileEnumerator allows you to operate on a set of #GFiles,
  # returning a #GFileInfo structure for each file enumerated (e.g.
  # g_file_enumerate_children() will return a #GFileEnumerator for each
  # of the children within a directory).
  #
  # To get the next file's information from a #GFileEnumerator, use
  # g_file_enumerator_next_file() or its asynchronous version,
  # g_file_enumerator_next_files_async(). Note that the asynchronous
  # version will return a list of #GFileInfos, whereas the
  # synchronous will only return the next file in the enumerator.
  #
  # The ordering of returned files is unspecified for non-Unix
  # platforms; for more information, see g_dir_read_name().  On Unix,
  # when operating on local files, returned files will be sorted by
  # inode number.  Effectively you can assume that the ordering of
  # returned files will be stable between successive calls (and
  # applications) assuming the directory is unchanged.
  #
  # If your application needs a specific ordering, such as by name or
  # modification time, you will have to implement that in your
  # application code.
  #
  # To close a #GFileEnumerator, use g_file_enumerator_close(), or
  # its asynchronous version, g_file_enumerator_close_async(). Once
  # a #GFileEnumerator is closed, no further actions may be performed
  # on it, and it should be freed with g_object_unref().
  class FileEnumerator < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, container : Gio::File? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if container
        (_names.to_unsafe + _n).value = "container".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, container)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FileEnumerator.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_enumerator_get_type
    end

    def container=(value : Gio::File?) : Gio::File?
      unsafe_value = value

      LibGObject.g_object_set(self, "container", unsafe_value, Pointer(Void).null)
      value
    end

    def close(cancellable : Gio::Cancellable?) : Bool
      # g_file_enumerator_close: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_file_enumerator_close(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def close_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_file_enumerator_close_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_file_enumerator_close_async(self, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def close_finish(result : Gio::AsyncResult) : Bool
      # g_file_enumerator_close_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_file_enumerator_close_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def child(info : Gio::FileInfo) : Gio::File
      # g_file_enumerator_get_child: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_enumerator_get_child(self, info)

      # Return value handling
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def container : Gio::File
      # g_file_enumerator_get_container: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_enumerator_get_container(self)

      # Return value handling
      Gio::File__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def has_pending : Bool
      # g_file_enumerator_has_pending: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_enumerator_has_pending(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_closed : Bool
      # g_file_enumerator_is_closed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_enumerator_is_closed(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def iterate(cancellable : Gio::Cancellable?) : Bool
      # g_file_enumerator_iterate: (Method | Throws)
      # @out_info: (out) (optional)
      # @out_child: (out) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      out_info = Pointer(Pointer(Void)).null
      out_child = Pointer(Pointer(Void)).null
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_file_enumerator_iterate(self, out_info, out_child, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def next_file(cancellable : Gio::Cancellable?) : Gio::FileInfo?
      # g_file_enumerator_next_file: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_file_enumerator_next_file(self, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def next_files_async(num_files : Int32, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_file_enumerator_next_files_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_file_enumerator_next_files_async(self, num_files, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    def next_files_finish(result : Gio::AsyncResult) : GLib::List
      # g_file_enumerator_next_files_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGio.g_file_enumerator_next_files_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?
      # Return value handling
      GLib::List(Gio::FileInfo).new(_retval, GICrystal::Transfer::Full)
    end

    def pending=(pending : Bool) : Nil
      # g_file_enumerator_set_pending: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_enumerator_set_pending(self, pending)

      # Return value handling
    end
  end
end

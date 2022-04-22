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
  @[GObject::GeneratedWrapper]
  class FileEnumerator < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::FileEnumeratorClass), class_init,
        sizeof(LibGio::FileEnumerator), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, container : Gio::File? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !container.nil?
        (_names.to_unsafe + _n).value = "container".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, container)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FileEnumerator.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
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

    # Releases all resources used by this enumerator, making the
    # enumerator return %G_IO_ERROR_CLOSED on all calls.
    #
    # This will be automatically called when the last reference
    # is dropped, but you might want to call this function to make
    # sure resources are released as early as possible.
    def close(cancellable : Gio::Cancellable?) : Bool
      # g_file_enumerator_close: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
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

    # Asynchronously closes the file enumerator.
    #
    # If @cancellable is not %NULL, then the operation can be cancelled by
    # triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be returned in
    # g_file_enumerator_close_finish().
    def close_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_file_enumerator_close_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # Generator::NullableArrayPlan
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_file_enumerator_close_async(self, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes closing a file enumerator, started from g_file_enumerator_close_async().
    #
    # If the file enumerator was already closed when g_file_enumerator_close_async()
    # was called, then this function will report %G_IO_ERROR_CLOSED in @error, and
    # return %FALSE. If the file enumerator had pending operation when the close
    # operation was started, then this function will report %G_IO_ERROR_PENDING, and
    # return %FALSE.  If @cancellable was not %NULL, then the operation may have been
    # cancelled by triggering the cancellable object from another thread. If the operation
    # was cancelled, the error %G_IO_ERROR_CANCELLED will be set, and %FALSE will be
    # returned.
    def close_finish(result : Gio::AsyncResult) : Bool
      # g_file_enumerator_close_finish: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_file_enumerator_close_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Return a new #GFile which refers to the file named by @info in the source
    # directory of @enumerator.  This function is primarily intended to be used
    # inside loops with g_file_enumerator_next_file().
    #
    # To use this, %G_FILE_ATTRIBUTE_STANDARD_NAME must have been listed in the
    # attributes list used when creating the #GFileEnumerator.
    #
    # This is a convenience method that's equivalent to:
    # |[<!-- language="C" -->
    #   gchar *name = g_file_info_get_name (info);
    #   GFile *child = g_file_get_child (g_file_enumerator_get_container (enumr),
    #                                    name);
    # ]|
    def child(info : Gio::FileInfo) : Gio::File
      # g_file_enumerator_get_child: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_file_enumerator_get_child(self, info)

      # Return value handling

      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    # Get the #GFile container which is being enumerated.
    def container : Gio::File
      # g_file_enumerator_get_container: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_enumerator_get_container(self)

      # Return value handling

      Gio::File__Impl.new(_retval, GICrystal::Transfer::None)
    end

    # Checks if the file enumerator has pending operations.
    def has_pending : Bool
      # g_file_enumerator_has_pending: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_enumerator_has_pending(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if the file enumerator has been closed.
    def is_closed : Bool
      # g_file_enumerator_is_closed: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_enumerator_is_closed(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # This is a version of g_file_enumerator_next_file() that's easier to
    # use correctly from C programs.  With g_file_enumerator_next_file(),
    # the gboolean return value signifies "end of iteration or error", which
    # requires allocation of a temporary #GError.
    #
    # In contrast, with this function, a %FALSE return from
    # g_file_enumerator_iterate() *always* means
    # "error".  End of iteration is signaled by @out_info or @out_child being %NULL.
    #
    # Another crucial difference is that the references for @out_info and
    # @out_child are owned by @direnum (they are cached as hidden
    # properties).  You must not unref them in your own code.  This makes
    # memory management significantly easier for C code in combination
    # with loops.
    #
    # Finally, this function optionally allows retrieving a #GFile as
    # well.
    #
    # You must specify at least one of @out_info or @out_child.
    #
    # The code pattern for correctly using g_file_enumerator_iterate() from C
    # is:
    #
    # |[
    # direnum = g_file_enumerate_children (file, ...);
    # while (TRUE)
    #   {
    #     GFileInfo *info;
    #     if (!g_file_enumerator_iterate (direnum, &info, NULL, cancellable, error))
    #       goto out;
    #     if (!info)
    #       break;
    #     ... do stuff with "info"; do not unref it! ...
    #   }
    #
    # out:
    #   g_object_unref (direnum); // Note: frees the last @info
    # ]|
    def iterate(cancellable : Gio::Cancellable?) : Bool
      # g_file_enumerator_iterate: (Method | Throws)
      # @out_info: (out) (optional)
      # @out_child: (out) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      out_info = Pointer(Pointer(Void)).null
      # Generator::OutArgUsedInReturnPlan
      out_child = Pointer(Pointer(Void)).null
      # Generator::NullableArrayPlan
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

    # Returns information for the next file in the enumerated object.
    # Will block until the information is available. The #GFileInfo
    # returned from this function will contain attributes that match the
    # attribute string that was passed when the #GFileEnumerator was created.
    #
    # See the documentation of #GFileEnumerator for information about the
    # order of returned files.
    #
    # On error, returns %NULL and sets @error to the error. If the
    # enumerator is at the end, %NULL will be returned and @error will
    # be unset.
    def next_file(cancellable : Gio::Cancellable?) : Gio::FileInfo?
      # g_file_enumerator_next_file: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
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

    # Request information for a number of files from the enumerator asynchronously.
    # When all i/o for the operation is finished the @callback will be called with
    # the requested information.
    #
    # See the documentation of #GFileEnumerator for information about the
    # order of returned files.
    #
    # The callback can be called with less than @num_files files in case of error
    # or at the end of the enumerator. In case of a partial error the callback will
    # be called with any succeeding items and no error, and on the next request the
    # error will be reported. If a request is cancelled the callback will be called
    # with %G_IO_ERROR_CANCELLED.
    #
    # During an async request no other sync and async calls are allowed, and will
    # result in %G_IO_ERROR_PENDING errors.
    #
    # Any outstanding i/o request with higher priority (lower numerical value) will
    # be executed before an outstanding request with lower priority. Default
    # priority is %G_PRIORITY_DEFAULT.
    def next_files_async(num_files : Int32, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_file_enumerator_next_files_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # Generator::NullableArrayPlan
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_file_enumerator_next_files_async(self, num_files, io_priority, cancellable, callback, user_data)

      # Return value handling
    end

    # Finishes the asynchronous operation started with g_file_enumerator_next_files_async().
    def next_files_finish(result : Gio::AsyncResult) : GLib::List
      # g_file_enumerator_next_files_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_file_enumerator_next_files_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::List(Gio::FileInfo).new(_retval, GICrystal::Transfer::Full)
    end

    # Sets the file enumerator as having pending operations.
    def pending=(pending : Bool) : Nil
      # g_file_enumerator_set_pending: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_enumerator_set_pending(self, pending)

      # Return value handling
    end
  end
end

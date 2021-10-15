module Gio
  # #GFile is a high level abstraction for manipulating files on a
  # virtual file system. #GFiles are lightweight, immutable objects
  # that do no I/O upon creation. It is necessary to understand that
  # #GFile objects do not represent files, merely an identifier for a
  # file. All file content I/O is implemented as streaming operations
  # (see #GInputStream and #GOutputStream).
  #
  # To construct a #GFile, you can use:
  # - g_file_new_for_path() if you have a path.
  # - g_file_new_for_uri() if you have a URI.
  # - g_file_new_for_commandline_arg() for a command line argument.
  # - g_file_new_tmp() to create a temporary file from a template.
  # - g_file_parse_name() from a UTF-8 string gotten from g_file_get_parse_name().
  # - g_file_new_build_filename() to create a file from path elements.
  #
  # One way to think of a #GFile is as an abstraction of a pathname. For
  # normal files the system pathname is what is stored internally, but as
  # #GFiles are extensible it could also be something else that corresponds
  # to a pathname in a userspace implementation of a filesystem.
  #
  # #GFiles make up hierarchies of directories and files that correspond to
  # the files on a filesystem. You can move through the file system with
  # #GFile using g_file_get_parent() to get an identifier for the parent
  # directory, g_file_get_child() to get a child within a directory,
  # g_file_resolve_relative_path() to resolve a relative path between two
  # #GFiles. There can be multiple hierarchies, so you may not end up at
  # the same root if you repeatedly call g_file_get_parent() on two different
  # files.
  #
  # All #GFiles have a basename (get with g_file_get_basename()). These names
  # are byte strings that are used to identify the file on the filesystem
  # (relative to its parent directory) and there is no guarantees that they
  # have any particular charset encoding or even make any sense at all. If
  # you want to use filenames in a user interface you should use the display
  # name that you can get by requesting the
  # %G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME attribute with g_file_query_info().
  # This is guaranteed to be in UTF-8 and can be used in a user interface.
  # But always store the real basename or the #GFile to use to actually
  # access the file, because there is no way to go from a display name to
  # the actual name.
  #
  # Using #GFile as an identifier has the same weaknesses as using a path
  # in that there may be multiple aliases for the same file. For instance,
  # hard or soft links may cause two different #GFiles to refer to the same
  # file. Other possible causes for aliases are: case insensitive filesystems,
  # short and long names on FAT/NTFS, or bind mounts in Linux. If you want to
  # check if two #GFiles point to the same file you can query for the
  # %G_FILE_ATTRIBUTE_ID_FILE attribute. Note that #GFile does some trivial
  # canonicalization of pathnames passed in, so that trivial differences in
  # the path string used at creation (duplicated slashes, slash at end of
  # path, "." or ".." path segments, etc) does not create different #GFiles.
  #
  # Many #GFile operations have both synchronous and asynchronous versions
  # to suit your application. Asynchronous versions of synchronous functions
  # simply have _async() appended to their function names. The asynchronous
  # I/O functions call a #GAsyncReadyCallback which is then used to finalize
  # the operation, producing a GAsyncResult which is then passed to the
  # function's matching _finish() operation.
  #
  # It is highly recommended to use asynchronous calls when running within a
  # shared main loop, such as in the main thread of an application. This avoids
  # I/O operations blocking other sources on the main loop from being dispatched.
  # Synchronous I/O operations should be performed from worker threads. See the
  # [introduction to asynchronous programming section][async-programming] for
  # more.
  #
  # Some #GFile operations almost always take a noticeable amount of time, and
  # so do not have synchronous analogs. Notable cases include:
  # - g_file_mount_mountable() to mount a mountable file.
  # - g_file_unmount_mountable_with_operation() to unmount a mountable file.
  # - g_file_eject_mountable_with_operation() to eject a mountable file.
  #
  # ## Entity Tags # {#gfile-etag}
  #
  # One notable feature of #GFiles are entity tags, or "etags" for
  # short. Entity tags are somewhat like a more abstract version of the
  # traditional mtime, and can be used to quickly determine if the file
  # has been modified from the version on the file system. See the
  # HTTP 1.1
  # [specification](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html)
  # for HTTP Etag headers, which are a very similar concept.
  module File
    def self.new_for_commandline_arg(arg : ::String) : Gio::File
      # g_file_new_for_commandline_arg: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_file_new_for_commandline_arg(arg)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_commandline_arg_and_cwd(arg : ::String, cwd : ::String) : Gio::File
      # g_file_new_for_commandline_arg_and_cwd: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_file_new_for_commandline_arg_and_cwd(arg, cwd)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_path(path : ::String) : Gio::File
      # g_file_new_for_path: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_file_new_for_path(path)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_for_uri(uri : ::String) : Gio::File
      # g_file_new_for_uri: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_file_new_for_uri(uri)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def new_tmp(tmpl : ::String?, iostream : Gio::FileIOStream) : Gio::File
      # g_file_new_tmp: (Throws)
      # @tmpl: (nullable)
      # @iostream: (out) (transfer full)
      # Returns: (transfer full)

      tmpl = if tmpl.nil?
               Pointer(LibC::Char).null
             else
               tmpl.to_unsafe
             end
      LibGObject.g_object_ref(iostream)

      _retval = LibGio.g_file_new_tmp(tmpl, iostream)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def self.parse_name(parse_name : ::String) : Gio::File
      # g_file_parse_name: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_file_parse_name(parse_name)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def append_to(flags : Gio::FileCreateFlags, cancellable : Gio::Cancellable?) : Gio::FileOutputStream
      # g_file_append_to: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_append_to(self, flags, cancellable)
      Gio::FileOutputStream.new(_retval, GICrystal::Transfer::Full)
    end

    def append_to_async(flags : Gio::FileCreateFlags, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_append_to_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_append_to_async(self, flags, io_priority, cancellable, callback, user_data)
    end

    def append_to_finish(res : Gio::AsyncResult) : Gio::FileOutputStream
      # g_file_append_to_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_append_to_finish(self, res)
      Gio::FileOutputStream.new(_retval, GICrystal::Transfer::Full)
    end

    def build_attribute_list_for_copy(flags : Gio::FileCopyFlags, cancellable : Gio::Cancellable?) : ::String
      # g_file_build_attribute_list_for_copy: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_build_attribute_list_for_copy(self, flags, cancellable)
      GICrystal.transfer_full(_retval)
    end

    def copy(destination : Gio::File, flags : Gio::FileCopyFlags, cancellable : Gio::Cancellable?, progress_callback : Pointer(Void)?, progress_callback_data : Pointer(Nil)?) : Bool
      # g_file_copy: (Method | Throws)
      # @cancellable: (nullable)
      # @progress_callback: (nullable)
      # @progress_callback_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      progress_callback = if progress_callback.nil?
                            LibGio::FileProgressCallback.null
                          else
                            progress_callback.to_unsafe
                          end
      progress_callback_data = if progress_callback_data.nil?
                                 Pointer(Void).null
                               else
                                 progress_callback_data.to_unsafe
                               end

      _retval = LibGio.g_file_copy(self, destination, flags, cancellable, progress_callback, progress_callback_data)
      GICrystal.to_bool(_retval)
    end

    def copy_async(destination : Gio::File, flags : Gio::FileCopyFlags, io_priority : Int32, cancellable : Gio::Cancellable?, progress_callback : Pointer(Void)?, progress_callback_data : Pointer(Nil)?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_copy_async: (Method)
      # @cancellable: (nullable)
      # @progress_callback: (nullable)
      # @progress_callback_data: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      progress_callback = if progress_callback.nil?
                            LibGio::FileProgressCallback.null
                          else
                            progress_callback.to_unsafe
                          end
      progress_callback_data = if progress_callback_data.nil?
                                 Pointer(Void).null
                               else
                                 progress_callback_data.to_unsafe
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

      LibGio.g_file_copy_async(self, destination, flags, io_priority, cancellable, progress_callback, progress_callback_data, callback, user_data)
    end

    def copy_attributes(destination : Gio::File, flags : Gio::FileCopyFlags, cancellable : Gio::Cancellable?) : Bool
      # g_file_copy_attributes: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_copy_attributes(self, destination, flags, cancellable)
      GICrystal.to_bool(_retval)
    end

    def copy_finish(res : Gio::AsyncResult) : Bool
      # g_file_copy_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_file_copy_finish(self, res)
      GICrystal.to_bool(_retval)
    end

    def create(flags : Gio::FileCreateFlags, cancellable : Gio::Cancellable?) : Gio::FileOutputStream
      # g_file_create: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_create(self, flags, cancellable)
      Gio::FileOutputStream.new(_retval, GICrystal::Transfer::Full)
    end

    def create_async(flags : Gio::FileCreateFlags, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_create_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_create_async(self, flags, io_priority, cancellable, callback, user_data)
    end

    def create_finish(res : Gio::AsyncResult) : Gio::FileOutputStream
      # g_file_create_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_create_finish(self, res)
      Gio::FileOutputStream.new(_retval, GICrystal::Transfer::Full)
    end

    def create_readwrite(flags : Gio::FileCreateFlags, cancellable : Gio::Cancellable?) : Gio::FileIOStream
      # g_file_create_readwrite: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_create_readwrite(self, flags, cancellable)
      Gio::FileIOStream.new(_retval, GICrystal::Transfer::Full)
    end

    def create_readwrite_async(flags : Gio::FileCreateFlags, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_create_readwrite_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_create_readwrite_async(self, flags, io_priority, cancellable, callback, user_data)
    end

    def create_readwrite_finish(res : Gio::AsyncResult) : Gio::FileIOStream
      # g_file_create_readwrite_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_create_readwrite_finish(self, res)
      Gio::FileIOStream.new(_retval, GICrystal::Transfer::Full)
    end

    def delete(cancellable : Gio::Cancellable?) : Bool
      # g_file_delete: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_delete(self, cancellable)
      GICrystal.to_bool(_retval)
    end

    def delete_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_delete_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_delete_async(self, io_priority, cancellable, callback, user_data)
    end

    def delete_finish(result : Gio::AsyncResult) : Bool
      # g_file_delete_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_file_delete_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def dup : Gio::File
      # g_file_dup: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_file_dup(self)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def eject_mountable(flags : Gio::MountUnmountFlags, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_eject_mountable: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_eject_mountable(self, flags, cancellable, callback, user_data)
    end

    def eject_mountable_finish(result : Gio::AsyncResult) : Bool
      # g_file_eject_mountable_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_file_eject_mountable_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def eject_mountable_with_operation(flags : Gio::MountUnmountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_eject_mountable_with_operation: (Method)
      # @mount_operation: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      mount_operation = if mount_operation.nil?
                          Pointer(Void).null
                        else
                          mount_operation.to_unsafe
                        end
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

      LibGio.g_file_eject_mountable_with_operation(self, flags, mount_operation, cancellable, callback, user_data)
    end

    def eject_mountable_with_operation_finish(result : Gio::AsyncResult) : Bool
      # g_file_eject_mountable_with_operation_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_file_eject_mountable_with_operation_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def enumerate_children(attributes : ::String, flags : Gio::FileQueryInfoFlags, cancellable : Gio::Cancellable?) : Gio::FileEnumerator
      # g_file_enumerate_children: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_enumerate_children(self, attributes, flags, cancellable)
      Gio::FileEnumerator.new(_retval, GICrystal::Transfer::Full)
    end

    def enumerate_children_async(attributes : ::String, flags : Gio::FileQueryInfoFlags, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_enumerate_children_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_enumerate_children_async(self, attributes, flags, io_priority, cancellable, callback, user_data)
    end

    def enumerate_children_finish(res : Gio::AsyncResult) : Gio::FileEnumerator
      # g_file_enumerate_children_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_enumerate_children_finish(self, res)
      Gio::FileEnumerator.new(_retval, GICrystal::Transfer::Full)
    end

    def equal(file2 : Gio::File) : Bool
      # g_file_equal: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_file_equal(self, file2)
      GICrystal.to_bool(_retval)
    end

    def find_enclosing_mount(cancellable : Gio::Cancellable?) : Gio::Mount
      # g_file_find_enclosing_mount: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_find_enclosing_mount(self, cancellable)
      Gio::Mount__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def find_enclosing_mount_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_find_enclosing_mount_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_find_enclosing_mount_async(self, io_priority, cancellable, callback, user_data)
    end

    def find_enclosing_mount_finish(res : Gio::AsyncResult) : Gio::Mount
      # g_file_find_enclosing_mount_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_find_enclosing_mount_finish(self, res)
      Gio::Mount__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def basename : ::Path?
      # g_file_get_basename: (Method)
      # Returns: (transfer full Filename)

      _retval = LibGio.g_file_get_basename(self)
      ::Path.new(GICrystal.transfer_full(_retval)) unless _retval.null?
    end

    def child(name : ::String) : Gio::File
      # g_file_get_child: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_file_get_child(self, name)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def child_for_display_name(display_name : ::String) : Gio::File
      # g_file_get_child_for_display_name: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_get_child_for_display_name(self, display_name)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def parent : Gio::File?
      # g_file_get_parent: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_file_get_parent(self)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def parse_name : ::String
      # g_file_get_parse_name: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_file_get_parse_name(self)
      GICrystal.transfer_full(_retval)
    end

    def path : ::Path?
      # g_file_get_path: (Method)
      # Returns: (transfer full Filename)

      _retval = LibGio.g_file_get_path(self)
      ::Path.new(GICrystal.transfer_full(_retval)) unless _retval.null?
    end

    def relative_path(descendant : Gio::File) : ::Path?
      # g_file_get_relative_path: (Method)
      # Returns: (transfer full Filename)

      _retval = LibGio.g_file_get_relative_path(self, descendant)
      ::Path.new(GICrystal.transfer_full(_retval)) unless _retval.null?
    end

    def uri : ::String
      # g_file_get_uri: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_file_get_uri(self)
      GICrystal.transfer_full(_retval)
    end

    def uri_scheme : ::String?
      # g_file_get_uri_scheme: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_file_get_uri_scheme(self)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def has_parent(parent : Gio::File?) : Bool
      # g_file_has_parent: (Method)
      # @parent: (nullable)
      # Returns: (transfer none)

      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      _retval = LibGio.g_file_has_parent(self, parent)
      GICrystal.to_bool(_retval)
    end

    def has_prefix(prefix : Gio::File) : Bool
      # g_file_has_prefix: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_file_has_prefix(self, prefix)
      GICrystal.to_bool(_retval)
    end

    def has_uri_scheme(uri_scheme : ::String) : Bool
      # g_file_has_uri_scheme: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_file_has_uri_scheme(self, uri_scheme)
      GICrystal.to_bool(_retval)
    end

    def hash : UInt32
      # g_file_hash: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_file_hash(self)
      _retval
    end

    def is_native : Bool
      # g_file_is_native: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_file_is_native(self)
      GICrystal.to_bool(_retval)
    end

    def load_bytes(cancellable : Gio::Cancellable?) : GLib::Bytes
      # g_file_load_bytes: (Method | Throws)
      # @cancellable: (nullable)
      # @etag_out: (out) (transfer full) (nullable) (optional)
      # Returns: (transfer full)

      etag_out = Pointer(Pointer(LibC::Char)).null
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      etag_out = if etag_out.nil?
                   Pointer(LibC::Char).null
                 else
                   etag_out.to_unsafe
                 end

      _retval = LibGio.g_file_load_bytes(self, cancellable, etag_out)
      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    def load_bytes_async(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_load_bytes_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_load_bytes_async(self, cancellable, callback, user_data)
    end

    def load_bytes_finish(result : Gio::AsyncResult) : GLib::Bytes
      # g_file_load_bytes_finish: (Method | Throws)
      # @etag_out: (out) (transfer full) (nullable) (optional)
      # Returns: (transfer full)

      etag_out = Pointer(Pointer(LibC::Char)).null
      etag_out = if etag_out.nil?
                   Pointer(LibC::Char).null
                 else
                   etag_out.to_unsafe
                 end

      _retval = LibGio.g_file_load_bytes_finish(self, result, etag_out)
      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    def load_contents(cancellable : Gio::Cancellable?, contents : Enumerable(UInt8)) : Bool
      # g_file_load_contents: (Method | Throws)
      # @cancellable: (nullable)
      # @contents: (out) (transfer full) (array length=length element-type UInt8)
      # @length: (out) (transfer full) (optional)
      # @etag_out: (out) (transfer full) (nullable) (optional)
      # Returns: (transfer none)

      length = contents.size
      length = Pointer(UInt64).null
      etag_out = Pointer(Pointer(LibC::Char)).null
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      etag_out = if etag_out.nil?
                   Pointer(LibC::Char).null
                 else
                   etag_out.to_unsafe
                 end
      contents = contents.to_a.to_unsafe

      _retval = LibGio.g_file_load_contents(self, cancellable, contents, length, etag_out)
      GICrystal.to_bool(_retval)
    end

    def load_contents_async(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_load_contents_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_load_contents_async(self, cancellable, callback, user_data)
    end

    def load_contents_finish(res : Gio::AsyncResult, contents : Enumerable(UInt8)) : Bool
      # g_file_load_contents_finish: (Method | Throws)
      # @contents: (out) (transfer full) (array length=length element-type UInt8)
      # @length: (out) (transfer full) (optional)
      # @etag_out: (out) (transfer full) (nullable) (optional)
      # Returns: (transfer none)

      length = contents.size
      length = Pointer(UInt64).null
      etag_out = Pointer(Pointer(LibC::Char)).null
      etag_out = if etag_out.nil?
                   Pointer(LibC::Char).null
                 else
                   etag_out.to_unsafe
                 end
      contents = contents.to_a.to_unsafe

      _retval = LibGio.g_file_load_contents_finish(self, res, contents, length, etag_out)
      GICrystal.to_bool(_retval)
    end

    def load_partial_contents_finish(res : Gio::AsyncResult, contents : Enumerable(UInt8)) : Bool
      # g_file_load_partial_contents_finish: (Method | Throws)
      # @contents: (out) (transfer full) (array length=length element-type UInt8)
      # @length: (out) (transfer full) (optional)
      # @etag_out: (out) (transfer full) (nullable) (optional)
      # Returns: (transfer none)

      length = contents.size
      length = Pointer(UInt64).null
      etag_out = Pointer(Pointer(LibC::Char)).null
      etag_out = if etag_out.nil?
                   Pointer(LibC::Char).null
                 else
                   etag_out.to_unsafe
                 end
      contents = contents.to_a.to_unsafe

      _retval = LibGio.g_file_load_partial_contents_finish(self, res, contents, length, etag_out)
      GICrystal.to_bool(_retval)
    end

    def make_directory(cancellable : Gio::Cancellable?) : Bool
      # g_file_make_directory: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_make_directory(self, cancellable)
      GICrystal.to_bool(_retval)
    end

    def make_directory_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_make_directory_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_make_directory_async(self, io_priority, cancellable, callback, user_data)
    end

    def make_directory_finish(result : Gio::AsyncResult) : Bool
      # g_file_make_directory_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_file_make_directory_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def make_directory_with_parents(cancellable : Gio::Cancellable?) : Bool
      # g_file_make_directory_with_parents: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_make_directory_with_parents(self, cancellable)
      GICrystal.to_bool(_retval)
    end

    def make_symbolic_link(symlink_value : ::String, cancellable : Gio::Cancellable?) : Bool
      # g_file_make_symbolic_link: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_make_symbolic_link(self, symlink_value, cancellable)
      GICrystal.to_bool(_retval)
    end

    def measure_disk_usage_finish(result : Gio::AsyncResult) : Bool
      # g_file_measure_disk_usage_finish: (Method | Throws)
      # @disk_usage: (out) (transfer full) (optional)
      # @num_dirs: (out) (transfer full) (optional)
      # @num_files: (out) (transfer full) (optional)
      # Returns: (transfer none)

      disk_usage = Pointer(UInt64).null
      num_dirs = Pointer(UInt64).null
      num_files = Pointer(UInt64).null

      _retval = LibGio.g_file_measure_disk_usage_finish(self, result, disk_usage, num_dirs, num_files)
      GICrystal.to_bool(_retval)
    end

    def monitor(flags : Gio::FileMonitorFlags, cancellable : Gio::Cancellable?) : Gio::FileMonitor
      # g_file_monitor: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_monitor(self, flags, cancellable)
      Gio::FileMonitor.new(_retval, GICrystal::Transfer::Full)
    end

    def monitor_directory(flags : Gio::FileMonitorFlags, cancellable : Gio::Cancellable?) : Gio::FileMonitor
      # g_file_monitor_directory: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_monitor_directory(self, flags, cancellable)
      Gio::FileMonitor.new(_retval, GICrystal::Transfer::Full)
    end

    def monitor_file(flags : Gio::FileMonitorFlags, cancellable : Gio::Cancellable?) : Gio::FileMonitor
      # g_file_monitor_file: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_monitor_file(self, flags, cancellable)
      Gio::FileMonitor.new(_retval, GICrystal::Transfer::Full)
    end

    def mount_enclosing_volume(flags : Gio::MountMountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_mount_enclosing_volume: (Method)
      # @mount_operation: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      mount_operation = if mount_operation.nil?
                          Pointer(Void).null
                        else
                          mount_operation.to_unsafe
                        end
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

      LibGio.g_file_mount_enclosing_volume(self, flags, mount_operation, cancellable, callback, user_data)
    end

    def mount_enclosing_volume_finish(result : Gio::AsyncResult) : Bool
      # g_file_mount_enclosing_volume_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_file_mount_enclosing_volume_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def mount_mountable(flags : Gio::MountMountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_mount_mountable: (Method)
      # @mount_operation: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      mount_operation = if mount_operation.nil?
                          Pointer(Void).null
                        else
                          mount_operation.to_unsafe
                        end
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

      LibGio.g_file_mount_mountable(self, flags, mount_operation, cancellable, callback, user_data)
    end

    def mount_mountable_finish(result : Gio::AsyncResult) : Gio::File
      # g_file_mount_mountable_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_mount_mountable_finish(self, result)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def move(destination : Gio::File, flags : Gio::FileCopyFlags, cancellable : Gio::Cancellable?, progress_callback : Pointer(Void)?, progress_callback_data : Pointer(Nil)?) : Bool
      # g_file_move: (Method | Throws)
      # @cancellable: (nullable)
      # @progress_callback: (nullable)
      # @progress_callback_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      progress_callback = if progress_callback.nil?
                            LibGio::FileProgressCallback.null
                          else
                            progress_callback.to_unsafe
                          end
      progress_callback_data = if progress_callback_data.nil?
                                 Pointer(Void).null
                               else
                                 progress_callback_data.to_unsafe
                               end

      _retval = LibGio.g_file_move(self, destination, flags, cancellable, progress_callback, progress_callback_data)
      GICrystal.to_bool(_retval)
    end

    def open_readwrite(cancellable : Gio::Cancellable?) : Gio::FileIOStream
      # g_file_open_readwrite: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_open_readwrite(self, cancellable)
      Gio::FileIOStream.new(_retval, GICrystal::Transfer::Full)
    end

    def open_readwrite_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_open_readwrite_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_open_readwrite_async(self, io_priority, cancellable, callback, user_data)
    end

    def open_readwrite_finish(res : Gio::AsyncResult) : Gio::FileIOStream
      # g_file_open_readwrite_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_open_readwrite_finish(self, res)
      Gio::FileIOStream.new(_retval, GICrystal::Transfer::Full)
    end

    def peek_path : ::Path?
      # g_file_peek_path: (Method)
      # Returns: (transfer none Filename)

      _retval = LibGio.g_file_peek_path(self)
      ::Path.new(::String.new(_retval)) unless _retval.null?
    end

    def poll_mountable(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_poll_mountable: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_poll_mountable(self, cancellable, callback, user_data)
    end

    def poll_mountable_finish(result : Gio::AsyncResult) : Bool
      # g_file_poll_mountable_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_file_poll_mountable_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def query_default_handler(cancellable : Gio::Cancellable?) : Gio::AppInfo
      # g_file_query_default_handler: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_query_default_handler(self, cancellable)
      Gio::AppInfo__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def query_default_handler_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_query_default_handler_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_query_default_handler_async(self, io_priority, cancellable, callback, user_data)
    end

    def query_default_handler_finish(result : Gio::AsyncResult) : Gio::AppInfo
      # g_file_query_default_handler_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_query_default_handler_finish(self, result)
      Gio::AppInfo__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def query_exists(cancellable : Gio::Cancellable?) : Bool
      # g_file_query_exists: (Method)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_query_exists(self, cancellable)
      GICrystal.to_bool(_retval)
    end

    def query_file_type(flags : Gio::FileQueryInfoFlags, cancellable : Gio::Cancellable?) : Gio::FileType
      # g_file_query_file_type: (Method)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_query_file_type(self, flags, cancellable)
      Gio::FileType.from_value(_retval)
    end

    def query_filesystem_info(attributes : ::String, cancellable : Gio::Cancellable?) : Gio::FileInfo
      # g_file_query_filesystem_info: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_query_filesystem_info(self, attributes, cancellable)
      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def query_filesystem_info_async(attributes : ::String, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_query_filesystem_info_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_query_filesystem_info_async(self, attributes, io_priority, cancellable, callback, user_data)
    end

    def query_filesystem_info_finish(res : Gio::AsyncResult) : Gio::FileInfo
      # g_file_query_filesystem_info_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_query_filesystem_info_finish(self, res)
      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def query_info(attributes : ::String, flags : Gio::FileQueryInfoFlags, cancellable : Gio::Cancellable?) : Gio::FileInfo
      # g_file_query_info: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_query_info(self, attributes, flags, cancellable)
      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def query_info_async(attributes : ::String, flags : Gio::FileQueryInfoFlags, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_query_info_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_query_info_async(self, attributes, flags, io_priority, cancellable, callback, user_data)
    end

    def query_info_finish(res : Gio::AsyncResult) : Gio::FileInfo
      # g_file_query_info_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_query_info_finish(self, res)
      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def query_settable_attributes(cancellable : Gio::Cancellable?) : Gio::FileAttributeInfoList
      # g_file_query_settable_attributes: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_query_settable_attributes(self, cancellable)
      Gio::FileAttributeInfoList.new(_retval, GICrystal::Transfer::Full)
    end

    def query_writable_namespaces(cancellable : Gio::Cancellable?) : Gio::FileAttributeInfoList
      # g_file_query_writable_namespaces: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_query_writable_namespaces(self, cancellable)
      Gio::FileAttributeInfoList.new(_retval, GICrystal::Transfer::Full)
    end

    def read(cancellable : Gio::Cancellable?) : Gio::FileInputStream
      # g_file_read: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_read(self, cancellable)
      Gio::FileInputStream.new(_retval, GICrystal::Transfer::Full)
    end

    def read_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_read_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_read_async(self, io_priority, cancellable, callback, user_data)
    end

    def read_finish(res : Gio::AsyncResult) : Gio::FileInputStream
      # g_file_read_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_read_finish(self, res)
      Gio::FileInputStream.new(_retval, GICrystal::Transfer::Full)
    end

    def replace(etag : ::String?, make_backup : Bool, flags : Gio::FileCreateFlags, cancellable : Gio::Cancellable?) : Gio::FileOutputStream
      # g_file_replace: (Method | Throws)
      # @etag: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      etag = if etag.nil?
               Pointer(LibC::Char).null
             else
               etag.to_unsafe
             end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_replace(self, etag, make_backup, flags, cancellable)
      Gio::FileOutputStream.new(_retval, GICrystal::Transfer::Full)
    end

    def replace_async(etag : ::String?, make_backup : Bool, flags : Gio::FileCreateFlags, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_replace_async: (Method)
      # @etag: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      etag = if etag.nil?
               Pointer(LibC::Char).null
             else
               etag.to_unsafe
             end
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

      LibGio.g_file_replace_async(self, etag, make_backup, flags, io_priority, cancellable, callback, user_data)
    end

    def replace_contents(contents : Enumerable(UInt8), etag : ::String?, make_backup : Bool, flags : Gio::FileCreateFlags, cancellable : Gio::Cancellable?) : Bool
      # g_file_replace_contents: (Method | Throws)
      # @contents: (array length=length element-type UInt8)
      # @etag: (nullable)
      # @new_etag: (out) (transfer full) (nullable) (optional)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      length = contents.size
      new_etag = Pointer(Pointer(LibC::Char)).null
      etag = if etag.nil?
               Pointer(LibC::Char).null
             else
               etag.to_unsafe
             end
      new_etag = if new_etag.nil?
                   Pointer(LibC::Char).null
                 else
                   new_etag.to_unsafe
                 end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      contents = contents.to_a.to_unsafe

      _retval = LibGio.g_file_replace_contents(self, contents, length, etag, make_backup, flags, new_etag, cancellable)
      GICrystal.to_bool(_retval)
    end

    def replace_contents_async(contents : Enumerable(UInt8), etag : ::String?, make_backup : Bool, flags : Gio::FileCreateFlags, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_replace_contents_async: (Method)
      # @contents: (array length=length element-type UInt8)
      # @etag: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      length = contents.size
      etag = if etag.nil?
               Pointer(LibC::Char).null
             else
               etag.to_unsafe
             end
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
      contents = contents.to_a.to_unsafe

      LibGio.g_file_replace_contents_async(self, contents, length, etag, make_backup, flags, cancellable, callback, user_data)
    end

    def replace_contents_bytes_async(contents : GLib::Bytes, etag : ::String?, make_backup : Bool, flags : Gio::FileCreateFlags, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_replace_contents_bytes_async: (Method)
      # @etag: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      etag = if etag.nil?
               Pointer(LibC::Char).null
             else
               etag.to_unsafe
             end
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

      LibGio.g_file_replace_contents_bytes_async(self, contents, etag, make_backup, flags, cancellable, callback, user_data)
    end

    def replace_contents_finish(res : Gio::AsyncResult) : Bool
      # g_file_replace_contents_finish: (Method | Throws)
      # @new_etag: (out) (transfer full) (nullable) (optional)
      # Returns: (transfer none)

      new_etag = Pointer(Pointer(LibC::Char)).null
      new_etag = if new_etag.nil?
                   Pointer(LibC::Char).null
                 else
                   new_etag.to_unsafe
                 end

      _retval = LibGio.g_file_replace_contents_finish(self, res, new_etag)
      GICrystal.to_bool(_retval)
    end

    def replace_finish(res : Gio::AsyncResult) : Gio::FileOutputStream
      # g_file_replace_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_replace_finish(self, res)
      Gio::FileOutputStream.new(_retval, GICrystal::Transfer::Full)
    end

    def replace_readwrite(etag : ::String?, make_backup : Bool, flags : Gio::FileCreateFlags, cancellable : Gio::Cancellable?) : Gio::FileIOStream
      # g_file_replace_readwrite: (Method | Throws)
      # @etag: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      etag = if etag.nil?
               Pointer(LibC::Char).null
             else
               etag.to_unsafe
             end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_replace_readwrite(self, etag, make_backup, flags, cancellable)
      Gio::FileIOStream.new(_retval, GICrystal::Transfer::Full)
    end

    def replace_readwrite_async(etag : ::String?, make_backup : Bool, flags : Gio::FileCreateFlags, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_replace_readwrite_async: (Method)
      # @etag: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      etag = if etag.nil?
               Pointer(LibC::Char).null
             else
               etag.to_unsafe
             end
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

      LibGio.g_file_replace_readwrite_async(self, etag, make_backup, flags, io_priority, cancellable, callback, user_data)
    end

    def replace_readwrite_finish(res : Gio::AsyncResult) : Gio::FileIOStream
      # g_file_replace_readwrite_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_replace_readwrite_finish(self, res)
      Gio::FileIOStream.new(_retval, GICrystal::Transfer::Full)
    end

    def resolve_relative_path(relative_path : ::String) : Gio::File
      # g_file_resolve_relative_path: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_file_resolve_relative_path(self, relative_path)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def set_attribute(attribute : ::String, type : Gio::FileAttributeType, value_p : Pointer(Nil)?, flags : Gio::FileQueryInfoFlags, cancellable : Gio::Cancellable?) : Bool
      # g_file_set_attribute: (Method | Throws)
      # @value_p: (nullable)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      value_p = if value_p.nil?
                  Pointer(Void).null
                else
                  value_p.to_unsafe
                end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_set_attribute(self, attribute, type, value_p, flags, cancellable)
      GICrystal.to_bool(_retval)
    end

    def set_attribute_byte_string(attribute : ::String, value : ::String, flags : Gio::FileQueryInfoFlags, cancellable : Gio::Cancellable?) : Bool
      # g_file_set_attribute_byte_string: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_set_attribute_byte_string(self, attribute, value, flags, cancellable)
      GICrystal.to_bool(_retval)
    end

    def set_attribute_int32(attribute : ::String, value : Int32, flags : Gio::FileQueryInfoFlags, cancellable : Gio::Cancellable?) : Bool
      # g_file_set_attribute_int32: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_set_attribute_int32(self, attribute, value, flags, cancellable)
      GICrystal.to_bool(_retval)
    end

    def set_attribute_int64(attribute : ::String, value : Int64, flags : Gio::FileQueryInfoFlags, cancellable : Gio::Cancellable?) : Bool
      # g_file_set_attribute_int64: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_set_attribute_int64(self, attribute, value, flags, cancellable)
      GICrystal.to_bool(_retval)
    end

    def set_attribute_string(attribute : ::String, value : ::String, flags : Gio::FileQueryInfoFlags, cancellable : Gio::Cancellable?) : Bool
      # g_file_set_attribute_string: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_set_attribute_string(self, attribute, value, flags, cancellable)
      GICrystal.to_bool(_retval)
    end

    def set_attribute_uint32(attribute : ::String, value : UInt32, flags : Gio::FileQueryInfoFlags, cancellable : Gio::Cancellable?) : Bool
      # g_file_set_attribute_uint32: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_set_attribute_uint32(self, attribute, value, flags, cancellable)
      GICrystal.to_bool(_retval)
    end

    def set_attribute_uint64(attribute : ::String, value : UInt64, flags : Gio::FileQueryInfoFlags, cancellable : Gio::Cancellable?) : Bool
      # g_file_set_attribute_uint64: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_set_attribute_uint64(self, attribute, value, flags, cancellable)
      GICrystal.to_bool(_retval)
    end

    def set_attributes_async(info : Gio::FileInfo, flags : Gio::FileQueryInfoFlags, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_set_attributes_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_set_attributes_async(self, info, flags, io_priority, cancellable, callback, user_data)
    end

    def set_attributes_finish(result : Gio::AsyncResult, info : Gio::FileInfo) : Bool
      # g_file_set_attributes_finish: (Method | Throws)
      # @info: (out) (transfer full)
      # Returns: (transfer none)

      LibGObject.g_object_ref(info)

      _retval = LibGio.g_file_set_attributes_finish(self, result, info)
      GICrystal.to_bool(_retval)
    end

    def set_attributes_from_info(info : Gio::FileInfo, flags : Gio::FileQueryInfoFlags, cancellable : Gio::Cancellable?) : Bool
      # g_file_set_attributes_from_info: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_set_attributes_from_info(self, info, flags, cancellable)
      GICrystal.to_bool(_retval)
    end

    def set_display_name(display_name : ::String, cancellable : Gio::Cancellable?) : Gio::File
      # g_file_set_display_name: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_set_display_name(self, display_name, cancellable)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def set_display_name_async(display_name : ::String, io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_set_display_name_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_set_display_name_async(self, display_name, io_priority, cancellable, callback, user_data)
    end

    def display_name_finish=(res : Gio::AsyncResult) : Gio::File
      # g_file_set_display_name_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_file_set_display_name_finish(self, res)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def start_mountable(flags : Gio::DriveStartFlags, start_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_start_mountable: (Method)
      # @start_operation: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      start_operation = if start_operation.nil?
                          Pointer(Void).null
                        else
                          start_operation.to_unsafe
                        end
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

      LibGio.g_file_start_mountable(self, flags, start_operation, cancellable, callback, user_data)
    end

    def start_mountable_finish(result : Gio::AsyncResult) : Bool
      # g_file_start_mountable_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_file_start_mountable_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def stop_mountable(flags : Gio::MountUnmountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_stop_mountable: (Method)
      # @mount_operation: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      mount_operation = if mount_operation.nil?
                          Pointer(Void).null
                        else
                          mount_operation.to_unsafe
                        end
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

      LibGio.g_file_stop_mountable(self, flags, mount_operation, cancellable, callback, user_data)
    end

    def stop_mountable_finish(result : Gio::AsyncResult) : Bool
      # g_file_stop_mountable_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_file_stop_mountable_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def supports_thread_contexts : Bool
      # g_file_supports_thread_contexts: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_file_supports_thread_contexts(self)
      GICrystal.to_bool(_retval)
    end

    def trash(cancellable : Gio::Cancellable?) : Bool
      # g_file_trash: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_file_trash(self, cancellable)
      GICrystal.to_bool(_retval)
    end

    def trash_async(io_priority : Int32, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_trash_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_trash_async(self, io_priority, cancellable, callback, user_data)
    end

    def trash_finish(result : Gio::AsyncResult) : Bool
      # g_file_trash_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_file_trash_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def unmount_mountable(flags : Gio::MountUnmountFlags, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_unmount_mountable: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

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

      LibGio.g_file_unmount_mountable(self, flags, cancellable, callback, user_data)
    end

    def unmount_mountable_finish(result : Gio::AsyncResult) : Bool
      # g_file_unmount_mountable_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_file_unmount_mountable_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    def unmount_mountable_with_operation(flags : Gio::MountUnmountFlags, mount_operation : Gio::MountOperation?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_file_unmount_mountable_with_operation: (Method)
      # @mount_operation: (nullable)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      mount_operation = if mount_operation.nil?
                          Pointer(Void).null
                        else
                          mount_operation.to_unsafe
                        end
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

      LibGio.g_file_unmount_mountable_with_operation(self, flags, mount_operation, cancellable, callback, user_data)
    end

    def unmount_mountable_with_operation_finish(result : Gio::AsyncResult) : Bool
      # g_file_unmount_mountable_with_operation_finish: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_file_unmount_mountable_with_operation_finish(self, result)
      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class File__Impl
    include File

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
      LibGio.g_file_get_type
    end

    # Cast a `GObject::Object` to `File`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to File")
    end

    # Cast a `GObject::Object` to `File`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end

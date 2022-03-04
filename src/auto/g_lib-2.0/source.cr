module GLib
  # The `GSource` struct is an opaque data type
  # representing an event source.
  class Source
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGLib::Source))
      @pointer.copy_from(pointer, sizeof(LibGLib::Source))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(callback_data : Pointer(Void)? = nil, callback_funcs : GLib::SourceCallbackFuncs? = nil, source_funcs : GLib::SourceFuncs? = nil, ref_count : UInt32? = nil, context : GLib::MainContext? = nil, priority : Int32? = nil, flags : UInt32? = nil, source_id : UInt32? = nil, poll_fds : GLib::SList? = nil, prev : GLib::Source? = nil, next _next : GLib::Source? = nil, name : ::String? = nil, priv : GLib::SourcePrivate? = nil)
      _ptr = Pointer(Void).malloc(96)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.callback_data = callback_data unless callback_data.nil?
      _instance.callback_funcs = callback_funcs unless callback_funcs.nil?
      _instance.source_funcs = source_funcs unless source_funcs.nil?
      _instance.ref_count = ref_count unless ref_count.nil?
      _instance.context = context unless context.nil?
      _instance.priority = priority unless priority.nil?
      _instance.flags = flags unless flags.nil?
      _instance.source_id = source_id unless source_id.nil?
      _instance.poll_fds = poll_fds unless poll_fds.nil?
      _instance.prev = prev unless prev.nil?
      _instance.next = _next unless _next.nil?
      _instance.name = name unless name.nil?
      _instance.priv = priv unless priv.nil?
      _instance
    end

    def finalize
    end

    def callback_data : Pointer(Void)
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(Void)))
      _var.value
    end

    def callback_data=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(Void))).value = value
      value
    end

    def callback_funcs : GLib::SourceCallbackFuncs
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(Void)))
      GLib::SourceCallbackFuncs.new(_var.value, GICrystal::Transfer::None)
    end

    def callback_funcs=(value : GLib::SourceCallbackFuncs)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(Void))).value = value.to_unsafe
      value
    end

    def source_funcs : GLib::SourceFuncs
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(Void)))
      GLib::SourceFuncs.new(_var.value, GICrystal::Transfer::None)
    end

    def source_funcs=(value : GLib::SourceFuncs)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(Void))).value = value.to_unsafe
      value
    end

    def ref_count : UInt32
      # Property getter
      _var = (@pointer + 24).as(Pointer(UInt32))
      _var.value
    end

    def ref_count=(value : UInt32)
      # Property setter
      _var = (@pointer + 24).as(Pointer(UInt32)).value = value
      value
    end

    def context : GLib::MainContext
      # Property getter
      _var = (@pointer + 32).as(Pointer(Pointer(Void)))
      GLib::MainContext.new(_var.value, GICrystal::Transfer::None)
    end

    def context=(value : GLib::MainContext)
      # Property setter
      _var = (@pointer + 32).as(Pointer(Pointer(Void))).value = value.to_unsafe
      value
    end

    def priority : Int32
      # Property getter
      _var = (@pointer + 40).as(Pointer(Int32))
      _var.value
    end

    def priority=(value : Int32)
      # Property setter
      _var = (@pointer + 40).as(Pointer(Int32)).value = value
      value
    end

    def flags : UInt32
      # Property getter
      _var = (@pointer + 44).as(Pointer(UInt32))
      _var.value
    end

    def flags=(value : UInt32)
      # Property setter
      _var = (@pointer + 44).as(Pointer(UInt32)).value = value
      value
    end

    def source_id : UInt32
      # Property getter
      _var = (@pointer + 48).as(Pointer(UInt32))
      _var.value
    end

    def source_id=(value : UInt32)
      # Property setter
      _var = (@pointer + 48).as(Pointer(UInt32)).value = value
      value
    end

    def poll_fds : GLib::SList
      # Property getter
      _var = (@pointer + 56).as(Pointer(Pointer(LibGLib::SList)))
      GLib::SList(Pointer(Void)).new(_var.value, GICrystal::Transfer::None)
    end

    def poll_fds=(value : GLib::SList)
      # Property setter
      _var = (@pointer + 56).as(Pointer(Pointer(LibGLib::SList))).value = value
      value
    end

    def prev : GLib::Source
      # Property getter
      _var = (@pointer + 64).as(Pointer(Pointer(Void)))
      GLib::Source.new(_var.value, GICrystal::Transfer::None)
    end

    def prev=(value : GLib::Source)
      # Property setter
      _var = (@pointer + 64).as(Pointer(Pointer(Void))).value = value.to_unsafe
      value
    end

    def next : GLib::Source
      # Property getter
      _var = (@pointer + 72).as(Pointer(Pointer(Void)))
      GLib::Source.new(_var.value, GICrystal::Transfer::None)
    end

    def next=(value : GLib::Source)
      # Property setter
      _var = (@pointer + 72).as(Pointer(Pointer(Void))).value = value.to_unsafe
      value
    end

    def name : ::String
      # Property getter
      _var = (@pointer + 80).as(Pointer(Pointer(LibC::Char)))
      ::String.new(_var.value)
    end

    def name=(value : ::String)
      # Property setter
      _var = (@pointer + 80).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def priv : GLib::SourcePrivate
      # Property getter
      _var = (@pointer + 88).as(Pointer(Pointer(Void)))
      GLib::SourcePrivate.new(_var.value, GICrystal::Transfer::None)
    end

    def priv=(value : GLib::SourcePrivate)
      # Property setter
      _var = (@pointer + 88).as(Pointer(Pointer(Void))).value = value.to_unsafe
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGLib.g_source_get_type
    end

    def initialize(source_funcs : GLib::SourceFuncs, struct_size : UInt32)
      # g_source_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGLib.g_source_new(source_funcs, struct_size)

      # Return value handling
      @pointer = _retval
    end

    def add_child_source(child_source : GLib::Source) : Nil
      # g_source_add_child_source: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_source_add_child_source(self, child_source)

      # Return value handling
    end

    def add_unix_fd(fd : Int32, events : GLib::IOCondition) : Pointer(Void)
      # g_source_add_unix_fd: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_source_add_unix_fd(self, fd, events)

      # Return value handling
      _retval
    end

    def attach(context : GLib::MainContext?) : UInt32
      # g_source_attach: (Method)
      # @context: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      context = if context.nil?
                  Pointer(Void).null
                else
                  context.to_unsafe
                end

      # C call
      _retval = LibGLib.g_source_attach(self, context)

      # Return value handling
      _retval
    end

    def destroy : Nil
      # g_source_destroy: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_source_destroy(self)

      # Return value handling
    end

    def can_recurse : Bool
      # g_source_get_can_recurse: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_source_get_can_recurse(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def context : GLib::MainContext?
      # g_source_get_context: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_source_get_context(self)

      # Return value handling
      GLib::MainContext.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def current_time(timeval : GLib::TimeVal) : Nil
      # g_source_get_current_time: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_source_get_current_time(self, timeval)

      # Return value handling
    end

    def id : UInt32
      # g_source_get_id: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_source_get_id(self)

      # Return value handling
      _retval
    end

    def name : ::String?
      # g_source_get_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_source_get_name(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def priority : Int32
      # g_source_get_priority: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_source_get_priority(self)

      # Return value handling
      _retval
    end

    def ready_time : Int64
      # g_source_get_ready_time: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_source_get_ready_time(self)

      # Return value handling
      _retval
    end

    def time : Int64
      # g_source_get_time: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_source_get_time(self)

      # Return value handling
      _retval
    end

    def is_destroyed : Bool
      # g_source_is_destroyed: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_source_is_destroyed(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def modify_unix_fd(tag : Pointer(Void), new_events : GLib::IOCondition) : Nil
      # g_source_modify_unix_fd: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_source_modify_unix_fd(self, tag, new_events)

      # Return value handling
    end

    def query_unix_fd(tag : Pointer(Void)) : GLib::IOCondition
      # g_source_query_unix_fd: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_source_query_unix_fd(self, tag)

      # Return value handling
      GLib::IOCondition.from_value(_retval)
    end

    def ref : GLib::Source
      # g_source_ref: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGLib.g_source_ref(self)

      # Return value handling
      GLib::Source.new(_retval, GICrystal::Transfer::Full)
    end

    def remove_child_source(child_source : GLib::Source) : Nil
      # g_source_remove_child_source: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_source_remove_child_source(self, child_source)

      # Return value handling
    end

    def remove_unix_fd(tag : Pointer(Void)) : Nil
      # g_source_remove_unix_fd: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_source_remove_unix_fd(self, tag)

      # Return value handling
    end

    def set_callback(func : Pointer(Void), data : Pointer(Void)?, notify : Pointer(Void)?) : Nil
      # g_source_set_callback: (Method)
      # @data: (nullable)
      # @notify: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end
      notify = if notify.nil?
                 LibGLib::DestroyNotify.null
               else
                 notify.to_unsafe
               end

      # C call
      LibGLib.g_source_set_callback(self, func, data, notify)

      # Return value handling
    end

    def set_callback_indirect(callback_data : Pointer(Void)?, callback_funcs : GLib::SourceCallbackFuncs) : Nil
      # g_source_set_callback_indirect: (Method)
      # @callback_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      callback_data = if callback_data.nil?
                        Pointer(Void).null
                      else
                        callback_data.to_unsafe
                      end

      # C call
      LibGLib.g_source_set_callback_indirect(self, callback_data, callback_funcs)

      # Return value handling
    end

    def can_recurse=(can_recurse : Bool) : Nil
      # g_source_set_can_recurse: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_source_set_can_recurse(self, can_recurse)

      # Return value handling
    end

    def funcs=(funcs : GLib::SourceFuncs) : Nil
      # g_source_set_funcs: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_source_set_funcs(self, funcs)

      # Return value handling
    end

    def name=(name : ::String) : Nil
      # g_source_set_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_source_set_name(self, name)

      # Return value handling
    end

    def priority=(priority : Int32) : Nil
      # g_source_set_priority: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_source_set_priority(self, priority)

      # Return value handling
    end

    def ready_time=(ready_time : Int64) : Nil
      # g_source_set_ready_time: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_source_set_ready_time(self, ready_time)

      # Return value handling
    end

    def static_name=(name : ::String) : Nil
      # g_source_set_static_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_source_set_static_name(self, name)

      # Return value handling
    end

    def unref : Nil
      # g_source_unref: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_source_unref(self)

      # Return value handling
    end

    def self.remove(tag : UInt32) : Bool
      # g_source_remove: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_source_remove(tag)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def self.remove_by_funcs_user_data(funcs : GLib::SourceFuncs, user_data : Pointer(Void)?) : Bool
      # g_source_remove_by_funcs_user_data: (None)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGLib.g_source_remove_by_funcs_user_data(funcs, user_data)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def self.remove_by_user_data(user_data : Pointer(Void)?) : Bool
      # g_source_remove_by_user_data: (None)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGLib.g_source_remove_by_user_data(user_data)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def self.set_name_by_id(tag : UInt32, name : ::String) : Nil
      # g_source_set_name_by_id: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_source_set_name_by_id(tag, name)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end

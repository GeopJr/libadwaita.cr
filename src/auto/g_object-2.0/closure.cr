module GObject
  # A #GClosure represents a callback supplied by the programmer.
  #
  # It will generally comprise a function of some kind and a marshaller
  # used to call it. It is the responsibility of the marshaller to
  # convert the arguments for the invocation from #GValues into
  # a suitable form, perform the callback on the converted arguments,
  # and transform the return value back into a #GValue.
  #
  # In the case of C programs, a closure usually just holds a pointer
  # to a function and maybe a data argument, and the marshaller
  # converts between #GValue and native C types. The GObject
  # library provides the #GCClosure type for this purpose. Bindings for
  # other languages need marshallers which convert between #GValues
  # and suitable representations in the runtime of the language in
  # order to use functions written in that language as callbacks. Use
  # g_closure_set_marshal() to set the marshaller on such a custom
  # closure implementation.
  #
  # Within GObject, closures play an important role in the
  # implementation of signals. When a signal is registered, the
  # @c_marshaller argument to g_signal_new() specifies the default C
  # marshaller for any closure which is connected to this
  # signal. GObject provides a number of C marshallers for this
  # purpose, see the g_cclosure_marshal_*() functions. Additional C
  # marshallers can be generated with the [glib-genmarshal][glib-genmarshal]
  # utility.  Closures can be explicitly connected to signals with
  # g_signal_connect_closure(), but it usually more convenient to let
  # GObject create a closure automatically by using one of the
  # g_signal_connect_*() functions which take a callback function/user
  # data pair.
  #
  # Using closures has a number of important advantages over a simple
  # callback function/data pointer combination:
  #
  # - Closures allow the callee to get the types of the callback parameters,
  #   which means that language bindings don't have to write individual glue
  #   for each callback type.
  #
  # - The reference counting of #GClosure makes it easy to handle reentrancy
  #   right; if a callback is removed while it is being invoked, the closure
  #   and its parameters won't be freed until the invocation finishes.
  #
  # - g_closure_invalidate() and invalidation notifiers allow callbacks to be
  #   automatically removed when the objects they point to go away.
  class Closure
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGObject::Closure))
      @pointer.copy_from(pointer, sizeof(LibGObject::Closure))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(ref_count : UInt32? = nil, meta_marshal_nouse : UInt32? = nil, n_guards : UInt32? = nil, n_fnotifiers : UInt32? = nil, n_inotifiers : UInt32? = nil, in_inotify : UInt32? = nil, floating : UInt32? = nil, derivative_flag : UInt32? = nil, in_marshal : UInt32? = nil, is_invalid : UInt32? = nil, marshal : Pointer(Void)? = nil, data : Pointer(Void)? = nil, notifiers : GObject::ClosureNotifyData? = nil)
      _ptr = Pointer(Void).malloc(64)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.ref_count = ref_count unless ref_count.nil?
      _instance.meta_marshal_nouse = meta_marshal_nouse unless meta_marshal_nouse.nil?
      _instance.n_guards = n_guards unless n_guards.nil?
      _instance.n_fnotifiers = n_fnotifiers unless n_fnotifiers.nil?
      _instance.n_inotifiers = n_inotifiers unless n_inotifiers.nil?
      _instance.in_inotify = in_inotify unless in_inotify.nil?
      _instance.floating = floating unless floating.nil?
      _instance.derivative_flag = derivative_flag unless derivative_flag.nil?
      _instance.in_marshal = in_marshal unless in_marshal.nil?
      _instance.is_invalid = is_invalid unless is_invalid.nil?
      _instance.marshal = marshal unless marshal.nil?
      _instance.data = data unless data.nil?
      _instance.notifiers = notifiers unless notifiers.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGObject::Closure)).zero?
    end

    def ref_count : UInt32
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def ref_count=(value : UInt32)
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def meta_marshal_nouse : UInt32
      _var = (@pointer + 4).as(Pointer(UInt32))
      _var.value
    end

    def meta_marshal_nouse=(value : UInt32)
      _var = (@pointer + 4).as(Pointer(UInt32)).value = value
      value
    end

    def n_guards : UInt32
      _var = (@pointer + 8).as(Pointer(UInt32))
      _var.value
    end

    def n_guards=(value : UInt32)
      _var = (@pointer + 8).as(Pointer(UInt32)).value = value
      value
    end

    def n_fnotifiers : UInt32
      _var = (@pointer + 12).as(Pointer(UInt32))
      _var.value
    end

    def n_fnotifiers=(value : UInt32)
      _var = (@pointer + 12).as(Pointer(UInt32)).value = value
      value
    end

    def n_inotifiers : UInt32
      _var = (@pointer + 16).as(Pointer(UInt32))
      _var.value
    end

    def n_inotifiers=(value : UInt32)
      _var = (@pointer + 16).as(Pointer(UInt32)).value = value
      value
    end

    def in_inotify : UInt32
      _var = (@pointer + 20).as(Pointer(UInt32))
      _var.value
    end

    def in_inotify=(value : UInt32)
      _var = (@pointer + 20).as(Pointer(UInt32)).value = value
      value
    end

    def floating : UInt32
      _var = (@pointer + 24).as(Pointer(UInt32))
      _var.value
    end

    def floating=(value : UInt32)
      _var = (@pointer + 24).as(Pointer(UInt32)).value = value
      value
    end

    def derivative_flag : UInt32
      _var = (@pointer + 28).as(Pointer(UInt32))
      _var.value
    end

    def derivative_flag=(value : UInt32)
      _var = (@pointer + 28).as(Pointer(UInt32)).value = value
      value
    end

    def in_marshal : UInt32
      _var = (@pointer + 32).as(Pointer(UInt32))
      _var.value
    end

    def in_marshal=(value : UInt32)
      _var = (@pointer + 32).as(Pointer(UInt32)).value = value
      value
    end

    def is_invalid : UInt32
      _var = (@pointer + 36).as(Pointer(UInt32))
      _var.value
    end

    def is_invalid=(value : UInt32)
      _var = (@pointer + 36).as(Pointer(UInt32)).value = value
      value
    end

    def marshal : Pointer(Void)
      _var = (@pointer + 40).as(Pointer(-> Void))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def marshal=(value : Pointer(Void))
      _var = (@pointer + 40).as(Pointer(-> Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGObject::Closure))
      value
    end

    def data!
      self.data.not_nil!
    end

    def data : Pointer(Void)?
      _var = (@pointer + 48).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def data=(value : Pointer(Void)?)
      _var = (@pointer + 48).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def notifiers!
      self.notifiers.not_nil!
    end

    def notifiers : GObject::ClosureNotifyData?
      _var = (@pointer + 56).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      GObject::ClosureNotifyData.new(_var.value, GICrystal::Transfer::None)
    end

    def notifiers=(value : GObject::ClosureNotifyData?)
      _var = (@pointer + 56).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGObject.g_closure_get_type
    end

    def self.new_object(sizeof_closure : UInt32, object : GObject::Object) : self
      # g_closure_new_object: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGObject.g_closure_new_object(sizeof_closure, object)

      # Return value handling

      GObject::Closure.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_simple(sizeof_closure : UInt32, data : Pointer(Void)?) : self
      # g_closure_new_simple: (Constructor)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      _retval = LibGObject.g_closure_new_simple(sizeof_closure, data)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      GObject::Closure.new(_retval, GICrystal::Transfer::Full)
    end

    def invalidate : Nil
      # g_closure_invalidate: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_closure_invalidate(self)

      # Return value handling
    end

    def invoke(param_values : Enumerable(_), invocation_hint : Pointer(Void)?) : GObject::Value
      # g_closure_invoke: (Method)
      # @return_value: (out) (caller-allocates) (optional)
      # @param_values: (array length=n_param_values element-type Interface)
      # @invocation_hint: (nullable)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      return_value = Pointer(Void).null
      # Generator::CallerAllocatesPlan
      return_value = GObject::Value.new
      # Generator::ArrayLengthArgPlan
      n_param_values = param_values.size
      # Generator::ArrayArgPlan
      param_values = param_values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      # Generator::NullableArrayPlan
      invocation_hint = if invocation_hint.nil?
                          Pointer(Void).null
                        else
                          invocation_hint.to_unsafe
                        end

      # C call
      LibGObject.g_closure_invoke(self, return_value, n_param_values, param_values, invocation_hint)

      # Return value handling

      return_value
    end

    def ref : GObject::Closure
      # g_closure_ref: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_closure_ref(self)

      # Return value handling

      GObject::Closure.new(_retval, GICrystal::Transfer::None)
    end

    def sink : Nil
      # g_closure_sink: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_closure_sink(self)

      # Return value handling
    end

    def unref : Nil
      # g_closure_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_closure_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end

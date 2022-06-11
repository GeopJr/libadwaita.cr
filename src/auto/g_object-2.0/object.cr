module GObject
  # :nodoc:
  annotation GeneratedWrapper # This annotation is used to identify user types that inherit from GObject from binding types that does the same.

  end

  # The base object type.
  #
  # All the fields in the `GObject` structure are private to the implementation
  # and should never be accessed directly.
  #
  # Since GLib 2.72, all #GObjects are guaranteed to be aligned to at least the
  # alignment of the largest basic GLib type (typically this is #guint64 or
  # #gdouble). If you need larger alignment for an element in a #GObject, you
  # should allocate it on the heap (aligned), or arrange for your #GObject to be
  # appropriately padded. This guarantee applies to the #GObject (or derived)
  # struct, the #GObjectClass (or derived) struct, and any private data allocated
  # by G_ADD_PRIVATE().
  @[GObject::GeneratedWrapper]
  class Object
    @pointer : Pointer(Void)

    # Declares a GObject signal.
    #
    # Supported signal parameter types are:
    #
    #  - Integer types
    #  - Float types
    macro signal(signature)
      {%
        raise "signal parameter must be a signature (Macros::Call), got #{signature.class_name}" unless signature.is_a?(Call)
        raise "Signal signature #{signature} can't have a receiver" if signature.receiver
        raise "Signal signature #{signature} can't have a block argument" if signature.block_arg
      %}

      struct {{ signature.name.titleize }}Signal < GObject::Signal
        def name : String
          @detail ? "{{ signature.name }}::#{@detail}" : {{ signature.name.stringify }}
        end

        alias LeanProc = Proc({{ (signature.args.map(&.type) << Nil).splat }})

        def connect(*, after : Bool = false, &block : LeanProc) : GObject::SignalConnection
          connect(block, after: after)
        end

        def connect(handler : LeanProc, *, after : Bool = false) : GObject::SignalConnection
          _box = ::Box.box(handler)
          {% if signature.args.empty? %}
          handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) { ::Box(LeanProc).unbox(_lib_box).call }.pointer
          {% else %}
          handler = ->(_lib_sender : Pointer(Void),
          {% for arg in signature.args %}
          {%
            resolved_type = arg.type.resolve
            if resolved_type == String
              type = ::Pointer(UInt8)
            elsif resolved_type == Bool
              type = ::Int32
            else
              type = arg.type
            end
          %}
          {{ arg.var }} : {{ type }},
          {% end %}
          _lib_box : Pointer(Void)) {

            {% for arg in signature.args %}
            {% resolved_type = arg.type.resolve %}
            {% if arg.type.resolve == String %}
              {{ arg.var }} = String.new({{ arg.var }})
            {% elsif arg.type.resolve == Bool %}
              {{ arg.var }} = {{ arg.var }} != 0
            {% end %}
            {% end %}

            ::Box(LeanProc).unbox(_lib_box).call({{ signature.args.map(&.var).splat }})
          }.pointer
          {% end %}

          handler = LibGObject.g_signal_connect_data(@source, name, handler,
            GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
          GObject::SignalConnection.new(@source, handler)
        end

        def emit({{ signature.args.splat }})
          LibGObject.g_signal_emit_by_name(@source, {{ signature.name.stringify }}, {{ signature.args.map(&.var).splat }})
        end
      end

      def {{ signature.name }}_signal
        {{ signature.name.titleize }}Signal.new(self)
      end

      def self._class_init(klass : Pointer(LibGObject::TypeClass), user_data : Pointer(Void)) : Nil
        LibGObject.g_signal_new({{ signature.name.stringify }}, g_type,
        GObject::SignalFlags.flags(RunLast, NoRecurse, NoHooks),
        0,                   # class_offset
        Pointer(Void).null,  # accumulator
        Pointer(Void).null,  # accumulator_data
        Pointer(Void).null,  # marshaller
        GObject::TYPE_NONE,  # return_type
        {{ signature.args.size }}, # n_params
        {% for arg in signature.args %}
        {{ arg.type }}.g_type,
        {% end %}
        Pointer(Void).null)
        previous_def
      end
    end

    macro inherited
    
      {% unless @type.annotation(GObject::GeneratedWrapper) %}
      # GType for the new created type
      @@_g_type : UInt64 = 0

      def self.g_type : UInt64
        if LibGLib.g_once_init_enter(pointerof(@@_g_type)) != 0
          g_type = {{ @type.superclass.id }}._register_derived_type({{ @type.id }},
            ->_class_init(Pointer(LibGObject::TypeClass), Pointer(Void)),
            ->_instance_init(Pointer(LibGObject::TypeInstance), Pointer(LibGObject::TypeClass)))

          LibGLib.g_once_init_leave(pointerof(@@_g_type), g_type)
        end

        @@_g_type
      end

      # :nodoc:
      def self._class_init(klass : Pointer(LibGObject::TypeClass), user_data : Pointer(Void)) : Nil
      end

      # :nodoc:
      def self._instance_init(instance : Pointer(LibGObject::TypeInstance), type : Pointer(LibGObject::TypeClass)) : Nil
      end

      # Cast a `GObject::Object` to this type, returns nil if cast can't be made.
      def self.cast?(obj : GObject::Object) : self?
        return if LibGObject.g_type_check_instance_is_a(obj, g_type).zero?

        # If the object was collected by Crystal GC but still alive in C world we can't bring
        # the crystal object form the dead.
        gc_collected = LibGObject.g_object_get_qdata(obj, GICrystal::GC_COLLECTED_QDATA_KEY)
        instance = LibGObject.g_object_get_qdata(obj, GICrystal::INSTANCE_QDATA_KEY)
        raise GICrystal::ObjectCollectedError.new if gc_collected || instance.null?

        instance.as(self)
      end
      {% end %}
    
    end

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGObject::Object), instance_init, 0)
    end

    GICrystal.define_new_method(Object, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Object`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      LibGObject.g_object_ref_sink(self) if transfer.none? || LibGObject.g_object_is_floating(self) == 1
    end

    # Called by the garbage collector. Decreases the reference count of object.
    # (i.e. its memory is freed).
    def finalize
      {% if flag?(:debugmemory) %}
        LibC.printf("~%s at %p - ref count: %d\n", self.class.name.to_unsafe, self, ref_count)
      {% end %}
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).null)
      LibGObject.g_object_set_qdata(self, GICrystal::GC_COLLECTED_QDATA_KEY, Pointer(Void).new(0x1))
      LibGObject.g_object_unref(self)
    end

    # Returns a pointer to the C object.
    def to_unsafe
      @pointer
    end

    # Cast a `GObject::Object` to `Object`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Object")
    end

    # Cast a `GObject::Object` to `Object`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGObject.g_object_get_type
    end

    # Creates a new instance of a #GObject subtype and sets its properties.
    #
    # Construction parameters (see %G_PARAM_CONSTRUCT, %G_PARAM_CONSTRUCT_ONLY)
    # which are not explicitly specified are set to their default values.
    def self.newv(object_type : UInt64, parameters : Enumerable(GObject::Parameter)) : self
      # g_object_newv: (Constructor)
      # @parameters: (array length=n_parameters element-type Interface)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_parameters = parameters.size # Generator::ArrayArgPlan
      parameters = parameters.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGObject.g_object_newv(object_type, n_parameters, parameters)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::Full)
    end

    def self.compat_control(what : UInt64, data : Pointer(Void)?) : UInt64
      # g_object_compat_control: (None)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      _retval = LibGObject.g_object_compat_control(what, data)

      # Return value handling

      _retval
    end

    # Find the #GParamSpec with the given name for an
    # interface. Generally, the interface vtable passed in as @g_iface
    # will be the default vtable from g_type_default_interface_ref(), or,
    # if you know the interface has already been loaded,
    # g_type_default_interface_peek().
    def self.interface_find_property(g_iface : GObject::TypeInterface, property_name : ::String) : GObject::ParamSpec
      # g_object_interface_find_property: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_object_interface_find_property(g_iface, property_name)

      # Return value handling

      GObject::ParamSpec.new(_retval, GICrystal::Transfer::None)
    end

    # Lists the properties of an interface.Generally, the interface
    # vtable passed in as @g_iface will be the default vtable from
    # g_type_default_interface_ref(), or, if you know the interface has
    # already been loaded, g_type_default_interface_peek().
    def self.interface_list_properties(g_iface : GObject::TypeInterface) : Enumerable(GObject::ParamSpec)
      # g_object_interface_list_properties: (None)
      # @n_properties_p: (out) (transfer full)
      # Returns: (transfer container) (array length=n_properties_p element-type Interface)

      # Generator::OutArgUsedInReturnPlan
      n_properties_p = 0_u32
      # C call
      _retval = LibGObject.g_object_interface_list_properties(g_iface, pointerof(n_properties_p))

      # Return value handling

      GICrystal.transfer_array(_retval, n_properties_p, GICrystal::Transfer::Container)
    end

    # Creates a binding between @source_property on @source and @target_property
    # on @target.
    #
    # Whenever the @source_property is changed the @target_property is
    # updated using the same value. For instance:
    #
    # |[<!-- language="C" -->
    #   g_object_bind_property (action, "active", widget, "sensitive", 0);
    # ]|
    #
    # Will result in the "sensitive" property of the widget #GObject instance to be
    # updated with the same value of the "active" property of the action #GObject
    # instance.
    #
    # If @flags contains %G_BINDING_BIDIRECTIONAL then the binding will be mutual:
    # if @target_property on @target changes then the @source_property on @source
    # will be updated as well.
    #
    # The binding will automatically be removed when either the @source or the
    # @target instances are finalized. To remove the binding without affecting the
    # @source and the @target you can just call g_object_unref() on the returned
    # #GBinding instance.
    #
    # Removing the binding by calling g_object_unref() on it must only be done if
    # the binding, @source and @target are only used from a single thread and it
    # is clear that both @source and @target outlive the binding. Especially it
    # is not safe to rely on this if the binding, @source or @target can be
    # finalized from different threads. Keep another reference to the binding and
    # use g_binding_unbind() instead to be on the safe side.
    #
    # A #GObject can have multiple bindings.
    def bind_property(source_property : ::String, target : GObject::Object, target_property : ::String, flags : GObject::BindingFlags) : GObject::Binding
      # g_object_bind_property: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_object_bind_property(@pointer, source_property, target, target_property, flags)

      # Return value handling

      GObject::Binding.new(_retval, GICrystal::Transfer::None)
    end

    # Complete version of g_object_bind_property().
    #
    # Creates a binding between @source_property on @source and @target_property
    # on @target, allowing you to set the transformation functions to be used by
    # the binding.
    #
    # If @flags contains %G_BINDING_BIDIRECTIONAL then the binding will be mutual:
    # if @target_property on @target changes then the @source_property on @source
    # will be updated as well. The @transform_from function is only used in case
    # of bidirectional bindings, otherwise it will be ignored
    #
    # The binding will automatically be removed when either the @source or the
    # @target instances are finalized. This will release the reference that is
    # being held on the #GBinding instance; if you want to hold on to the
    # #GBinding instance, you will need to hold a reference to it.
    #
    # To remove the binding, call g_binding_unbind().
    #
    # A #GObject can have multiple bindings.
    #
    # The same @user_data parameter will be used for both @transform_to
    # and @transform_from transformation functions; the @notify function will
    # be called once, when the binding is removed. If you need different data
    # for each transformation function, please use
    # g_object_bind_property_with_closures() instead.
    def bind_property_full(source_property : ::String, target : GObject::Object, target_property : ::String, flags : GObject::BindingFlags, transform_to : GObject::Closure, transform_from : GObject::Closure) : GObject::Binding
      # g_object_bind_property_with_closures: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_object_bind_property_with_closures(@pointer, source_property, target, target_property, flags, transform_to, transform_from)

      # Return value handling

      GObject::Binding.new(_retval, GICrystal::Transfer::None)
    end

    # Increases the freeze count on @object. If the freeze count is
    # non-zero, the emission of "notify" signals on @object is
    # stopped. The signals are queued until the freeze count is decreased
    # to zero. Duplicate notifications are squashed so that at most one
    # #GObject::notify signal is emitted for each property modified while the
    # object is frozen.
    #
    # This is necessary for accessors that modify multiple properties to prevent
    # premature notification while the object is still being modified.
    def freeze_notify : Nil
      # g_object_freeze_notify: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_object_freeze_notify(@pointer)

      # Return value handling
    end

    # Gets a named field from the objects table of associations (see g_object_set_data()).
    def data(key : ::String) : Pointer(Void)?
      # g_object_get_data: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_object_get_data(@pointer, key)

      # Return value handling

      _retval unless _retval.null?
    end

    # Gets a property of an object.
    #
    # The @value can be:
    #
    #  - an empty #GValue initialized by %G_VALUE_INIT, which will be
    #    automatically initialized with the expected type of the property
    #    (since GLib 2.60)
    #  - a #GValue initialized with the expected type of the property
    #  - a #GValue initialized with a type to which the expected type
    #    of the property can be transformed
    #
    # In general, a copy is made of the property contents and the caller is
    # responsible for freeing the memory by calling g_value_unset().
    #
    # Note that g_object_get_property() is really intended for language
    # bindings, g_object_get() is much more convenient for C programming.
    def property(property_name : ::String, value : _) : Nil
      # g_object_get_property: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      LibGObject.g_object_get_property(@pointer, property_name, value)

      # Return value handling
    end

    # This function gets back user data pointers stored via
    # g_object_set_qdata().
    def qdata(quark : UInt32) : Pointer(Void)?
      # g_object_get_qdata: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_object_get_qdata(@pointer, quark)

      # Return value handling

      _retval unless _retval.null?
    end

    # Gets @n_properties properties for an @object.
    # Obtained properties will be set to @values. All properties must be valid.
    # Warnings will be emitted and undefined behaviour may result if invalid
    # properties are passed in.
    def getv(names : Enumerable(::String), values : Enumerable(_)) : Nil
      # g_object_getv: (Method)
      # @names: (array length=n_properties element-type Utf8)
      # @values: (array length=n_properties element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_properties = names.size # Generator::ArrayArgPlan
      names = names.to_a.map(&.to_unsafe).to_unsafe
      # Generator::ArrayLengthArgPlan
      n_properties = values.size # Generator::ArrayArgPlan
      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      # C call
      LibGObject.g_object_getv(@pointer, n_properties, names, values)

      # Return value handling
    end

    # Emits a "notify" signal for the property @property_name on @object.
    #
    # When possible, eg. when signaling a property change from within the class
    # that registered the property, you should use g_object_notify_by_pspec()
    # instead.
    #
    # Note that emission of the notify signal may be blocked with
    # g_object_freeze_notify(). In this case, the signal emissions are queued
    # and will be emitted (in reverse order) when g_object_thaw_notify() is
    # called.
    def notify(property_name : ::String) : Nil
      # g_object_notify: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_object_notify(@pointer, property_name)

      # Return value handling
    end

    # Emits a "notify" signal for the property specified by @pspec on @object.
    #
    # This function omits the property name lookup, hence it is faster than
    # g_object_notify().
    #
    # One way to avoid using g_object_notify() from within the
    # class that registered the properties, and using g_object_notify_by_pspec()
    # instead, is to store the GParamSpec used with
    # g_object_class_install_property() inside a static array, e.g.:
    #
    # |[<!-- language="C" -->
    #   enum
    #   {
    #     PROP_0,
    #     PROP_FOO,
    #     PROP_LAST
    #   };
    #
    #   static GParamSpec *properties[PROP_LAST];
    #
    #   static void
    #   my_object_class_init (MyObjectClass *klass)
    #   {
    #     properties[PROP_FOO] = g_param_spec_int ("foo", "Foo", "The foo",
    #                                              0, 100,
    #                                              50,
    #                                              G_PARAM_READWRITE);
    #     g_object_class_install_property (gobject_class,
    #                                      PROP_FOO,
    #                                      properties[PROP_FOO]);
    #   }
    # ]|
    #
    # and then notify a change on the "foo" property with:
    #
    # |[<!-- language="C" -->
    #   g_object_notify_by_pspec (self, properties[PROP_FOO]);
    # ]|
    def notify_by_pspec(pspec : GObject::ParamSpec) : Nil
      # g_object_notify_by_pspec: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_object_notify_by_pspec(@pointer, pspec)

      # Return value handling
    end

    # Releases all references to other objects. This can be used to break
    # reference cycles.
    #
    # This function should only be called from object system implementations.
    def run_dispose : Nil
      # g_object_run_dispose: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_object_run_dispose(@pointer)

      # Return value handling
    end

    # Each object carries around a table of associations from
    # strings to pointers.  This function lets you set an association.
    #
    # If the object already had an association with that name,
    # the old association will be destroyed.
    #
    # Internally, the @key is converted to a #GQuark using g_quark_from_string().
    # This means a copy of @key is kept permanently (even after @object has been
    # finalized) — so it is recommended to only use a small, bounded set of values
    # for @key in your program, to avoid the #GQuark storage growing unbounded.
    def set_data(key : ::String, data : Pointer(Void)?) : Nil
      # g_object_set_data: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGObject.g_object_set_data(@pointer, key, data)

      # Return value handling
    end

    # Sets a property on an object.
    def set_property(property_name : ::String, value : _) : Nil
      # g_object_set_property: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      LibGObject.g_object_set_property(@pointer, property_name, value)

      # Return value handling
    end

    # Remove a specified datum from the object's data associations,
    # without invoking the association's destroy handler.
    def steal_data(key : ::String) : Pointer(Void)?
      # g_object_steal_data: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGObject.g_object_steal_data(@pointer, key)

      # Return value handling

      _retval unless _retval.null?
    end

    # This function gets back user data pointers stored via
    # g_object_set_qdata() and removes the @data from object
    # without invoking its destroy() function (if any was
    # set).
    # Usually, calling this function is only required to update
    # user data pointers with a destroy notifier, for example:
    # |[<!-- language="C" -->
    # void
    # object_add_to_user_list (GObject     *object,
    #                          const gchar *new_string)
    # {
    #   // the quark, naming the object data
    #   GQuark quark_string_list = g_quark_from_static_string ("my-string-list");
    #   // retrieve the old string list
    #   GList *list = g_object_steal_qdata (object, quark_string_list);
    #
    #   // prepend new string
    #   list = g_list_prepend (list, g_strdup (new_string));
    #   // this changed 'list', so we need to set it again
    #   g_object_set_qdata_full (object, quark_string_list, list, free_string_list);
    # }
    # static void
    # free_string_list (gpointer data)
    # {
    #   GList *node, *list = data;
    #
    #   for (node = list; node; node = node->next)
    #     g_free (node->data);
    #   g_list_free (list);
    # }
    # ]|
    # Using g_object_get_qdata() in the above example, instead of
    # g_object_steal_qdata() would have left the destroy function set,
    # and thus the partial string list would have been freed upon
    # g_object_set_qdata_full().
    def steal_qdata(quark : UInt32) : Pointer(Void)?
      # g_object_steal_qdata: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGObject.g_object_steal_qdata(@pointer, quark)

      # Return value handling

      _retval unless _retval.null?
    end

    # Reverts the effect of a previous call to
    # g_object_freeze_notify(). The freeze count is decreased on @object
    # and when it reaches zero, queued "notify" signals are emitted.
    #
    # Duplicate notifications for each property are squashed so that at most one
    # #GObject::notify signal is emitted for each property, in the reverse order
    # in which they have been queued.
    #
    # It is an error to call this function when the freeze count is zero.
    def thaw_notify : Nil
      # g_object_thaw_notify: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_object_thaw_notify(@pointer)

      # Return value handling
    end

    # This function essentially limits the life time of the @closure to
    # the life time of the object. That is, when the object is finalized,
    # the @closure is invalidated by calling g_closure_invalidate() on
    # it, in order to prevent invocations of the closure with a finalized
    # (nonexisting) object. Also, g_object_ref() and g_object_unref() are
    # added as marshal guards to the @closure, to ensure that an extra
    # reference count is held on @object during invocation of the
    # @closure.  Usually, this function will be called on closures that
    # use this @object as closure data.
    def watch_closure(closure : GObject::Closure) : Nil
      # g_object_watch_closure: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_object_watch_closure(@pointer, closure)

      # Return value handling
    end

    # The notify signal is emitted on an object when one of its properties has
    # its value set through g_object_set_property(), g_object_set(), et al.
    #
    # Note that getting this signal doesn’t itself guarantee that the value of
    # the property has actually changed. When it is emitted is determined by the
    # derived GObject class. If the implementor did not create the property with
    # %G_PARAM_EXPLICIT_NOTIFY, then any call to g_object_set_property() results
    # in ::notify being emitted, even if the new value is the same as the old.
    # If they did pass %G_PARAM_EXPLICIT_NOTIFY, then this signal is emitted only
    # when they explicitly call g_object_notify() or g_object_notify_by_pspec(),
    # and common practice is to do that only when the value has actually changed.
    #
    # This signal is typically used to obtain change notification for a
    # single property, by specifying the property name as a detail in the
    # g_signal_connect() call, like this:
    #
    # |[<!-- language="C" -->
    # g_signal_connect (text_view->buffer, "notify::paste-target-list",
    #                   G_CALLBACK (gtk_text_view_target_list_notify),
    #                   text_view)
    # ]|
    #
    # It is important to note that you must use
    # [canonical parameter names][canonical-parameter-names] as
    # detail strings for the notify signal.
    struct NotifySignal < GObject::Signal
      def name : String
        @detail ? "notify::#{@detail}" : "notify"
      end

      def connect(*, after : Bool = false, &block : Proc(GObject::ParamSpec, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(GObject::ParamSpec, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_pspec : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          pspec = GObject::ParamSpec.new(lib_pspec, :none)
          ::Box(Proc(GObject::ParamSpec, Nil)).unbox(_lib_box).call(pspec)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(GObject::Object, GObject::ParamSpec, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_pspec : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = GObject::Object.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          pspec = GObject::ParamSpec.new(lib_pspec, :none)
          ::Box(Proc(GObject::Object, GObject::ParamSpec, Nil)).unbox(_lib_box).call(_sender, pspec)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(pspec : GObject::ParamSpec) : Nil
        LibGObject.g_signal_emit_by_name(@source, "notify", pspec)
      end
    end

    def notify_signal
      NotifySignal.new(self)
    end
  end
end

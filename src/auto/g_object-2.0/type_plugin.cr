module GObject
  # An interface that handles the lifecycle of dynamically loaded types.
  #
  # The GObject type system supports dynamic loading of types.
  # It goes as follows:
  #
  # 1. The type is initially introduced (usually upon loading the module
  #    the first time, or by your main application that knows what modules
  #    introduces what types), like this:
  #    |[<!-- language="C" -->
  #    new_type_id = g_type_register_dynamic (parent_type_id,
  #                                           "TypeName",
  #                                           new_type_plugin,
  #                                           type_flags);
  #    ]|
  #    where @new_type_plugin is an implementation of the
  #    #GTypePlugin interface.
  #
  # 2. The type's implementation is referenced, e.g. through
  #    g_type_class_ref() or through g_type_create_instance() (this is
  #    being called by g_object_new()) or through one of the above done on
  #    a type derived from @new_type_id.
  #
  # 3. This causes the type system to load the type's implementation by
  #    calling g_type_plugin_use() and g_type_plugin_complete_type_info()
  #    on @new_type_plugin.
  #
  # 4. At some point the type's implementation isn't required anymore,
  #    e.g. after g_type_class_unref() or g_type_free_instance() (called
  #    when the reference count of an instance drops to zero).
  #
  # 5. This causes the type system to throw away the information retrieved
  #    from g_type_plugin_complete_type_info() and then it calls
  #    g_type_plugin_unuse() on @new_type_plugin.
  #
  # 6. Things may repeat from the second step.
  #
  # So basically, you need to implement a #GTypePlugin type that
  # carries a use_count, once use_count goes from zero to one, you need
  # to load the implementation to successfully handle the upcoming
  # g_type_plugin_complete_type_info() call. Later, maybe after
  # succeeding use/unuse calls, once use_count drops to zero, you can
  # unload the implementation again. The type system makes sure to call
  # g_type_plugin_use() and g_type_plugin_complete_type_info() again
  # when the type is needed again.
  #
  # #GTypeModule is an implementation of #GTypePlugin that already
  # implements most of this except for the actual module loading and
  # unloading. It even handles multiple registered types per module.
  module TypePlugin
    def complete_interface_info(instance_type : UInt64, interface_type : UInt64, info : GObject::InterfaceInfo) : Nil
      # g_type_plugin_complete_interface_info: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGObject.g_type_plugin_complete_interface_info(self, instance_type, interface_type, info)

      # Return value handling
    end

    def complete_type_info(g_type : UInt64, info : GObject::TypeInfo, value_table : GObject::TypeValueTable) : Nil
      # g_type_plugin_complete_type_info: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGObject.g_type_plugin_complete_type_info(self, g_type, info, value_table)

      # Return value handling
    end

    def unuse : Nil
      # g_type_plugin_unuse: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGObject.g_type_plugin_unuse(self)

      # Return value handling
    end

    def use : Nil
      # g_type_plugin_use: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGObject.g_type_plugin_use(self)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class TypePlugin__Impl < GObject::Object
    include TypePlugin

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGObject.g_type_plugin_get_type
    end

    # Cast a `GObject::Object` to `TypePlugin`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to TypePlugin")
    end

    # Cast a `GObject::Object` to `TypePlugin`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end

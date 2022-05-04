require "../g_object-2.0/object"
require "./action_group"

require "./action_map"

module Gio
  # #GSimpleActionGroup is a hash table filled with #GAction objects,
  # implementing the #GActionGroup and #GActionMap interfaces.
  @[GObject::GeneratedWrapper]
  class SimpleActionGroup < GObject::Object
    include ActionGroup
    include ActionMap

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::SimpleActionGroupClass), class_init,
        sizeof(LibGio::SimpleActionGroup), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_simple_action_group_get_type
    end

    # Creates a new, empty, #GSimpleActionGroup.
    def initialize
      # g_simple_action_group_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_simple_action_group_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # A convenience function for creating multiple #GSimpleAction instances
    # and adding them to the action group.
    def add_entries(entries : Enumerable(Gio::ActionEntry), user_data : Pointer(Void)?) : Nil
      # g_simple_action_group_add_entries: (Method)
      # @entries: (array length=n_entries element-type Interface)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_entries = entries.size # Generator::ArrayArgPlan
      entries = entries.to_a.map(&.to_unsafe).to_unsafe
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_simple_action_group_add_entries(self, entries, n_entries, user_data)

      # Return value handling
    end

    # Adds an action to the action group.
    #
    # If the action group already contains an action with the same name as
    # @action then the old action is dropped from the group.
    #
    # The action group takes its own reference on @action.
    def insert(action : Gio::Action) : Nil
      # g_simple_action_group_insert: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_simple_action_group_insert(self, action)

      # Return value handling
    end

    # Looks up the action with the name @action_name in the group.
    #
    # If no such action exists, returns %NULL.
    def lookup(action_name : ::String) : Gio::Action
      # g_simple_action_group_lookup: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_simple_action_group_lookup(self, action_name)

      # Return value handling

      Gio::Action__Impl.new(_retval, GICrystal::Transfer::None)
    end

    # Removes the named action from the action group.
    #
    # If no action of this name is in the group then nothing happens.
    def remove(action_name : ::String) : Nil
      # g_simple_action_group_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_simple_action_group_remove(self, action_name)

      # Return value handling
    end
  end
end

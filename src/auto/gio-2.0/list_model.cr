module Gio
  # #GListModel is an interface that represents a mutable list of
  # #GObjects. Its main intention is as a model for various widgets in
  # user interfaces, such as list views, but it can also be used as a
  # convenient method of returning lists of data, with support for
  # updates.
  #
  # Each object in the list may also report changes in itself via some
  # mechanism (normally the #GObject::notify signal).  Taken together
  # with the #GListModel::items-changed signal, this provides for a list
  # that can change its membership, and in which the members can change
  # their individual properties.
  #
  # A good example would be the list of visible wireless network access
  # points, where each access point can report dynamic properties such as
  # signal strength.
  #
  # It is important to note that the #GListModel itself does not report
  # changes to the individual items.  It only reports changes to the list
  # membership.  If you want to observe changes to the objects themselves
  # then you need to connect signals to the objects that you are
  # interested in.
  #
  # All items in a #GListModel are of (or derived from) the same type.
  # g_list_model_get_item_type() returns that type.  The type may be an
  # interface, in which case all objects in the list must implement it.
  #
  # The semantics are close to that of an array:
  # g_list_model_get_n_items() returns the number of items in the list and
  # g_list_model_get_item() returns an item at a (0-based) position. In
  # order to allow implementations to calculate the list length lazily,
  # you can also iterate over items: starting from 0, repeatedly call
  # g_list_model_get_item() until it returns %NULL.
  #
  # An implementation may create objects lazily, but must take care to
  # return the same object for a given position until all references to
  # it are gone.
  #
  # On the other side, a consumer is expected only to hold references on
  # objects that are currently "user visible", in order to facilitate the
  # maximum level of laziness in the implementation of the list and to
  # reduce the required number of signal connections at a given time.
  #
  # This interface is intended only to be used from a single thread.  The
  # thread in which it is appropriate to use it depends on the particular
  # implementation, but typically it will be from the thread that owns
  # the [thread-default main context][g-main-context-push-thread-default]
  # in effect at the time that the model was created.
  module ListModel
    def item_type : UInt64
      # g_list_model_get_item_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_list_model_get_item_type(@pointer)

      # Return value handling

      _retval
    end

    def n_items : UInt32
      # g_list_model_get_n_items: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_list_model_get_n_items(@pointer)

      # Return value handling

      _retval
    end

    def item(position : UInt32) : GObject::Object?
      # g_list_model_get_object: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_list_model_get_object(@pointer, position)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def items_changed(position : UInt32, removed : UInt32, added : UInt32) : Nil
      # g_list_model_items_changed: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_list_model_items_changed(@pointer, position, removed, added)

      # Return value handling
    end

    struct ItemsChangedSignal < GObject::Signal
      def name : String
        @detail ? "items-changed::#{@detail}" : "items-changed"
      end

      def connect(*, after : Bool = false, &block : Proc(UInt32, UInt32, UInt32, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(UInt32, UInt32, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_position : UInt32, lib_removed : UInt32, lib_added : UInt32, _lib_box : Pointer(Void)) {
          position = lib_position
          removed = lib_removed
          added = lib_added
          ::Box(Proc(UInt32, UInt32, UInt32, Nil)).unbox(_lib_box).call(position, removed, added)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::ListModel, UInt32, UInt32, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_position : UInt32, lib_removed : UInt32, lib_added : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractListModel.new(_lib_sender, GICrystal::Transfer::None)
          position = lib_position
          removed = lib_removed
          added = lib_added
          ::Box(Proc(Gio::ListModel, UInt32, UInt32, UInt32, Nil)).unbox(_lib_box).call(_sender, position, removed, added)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(position : UInt32, removed : UInt32, added : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "items-changed", position, removed, added)
      end
    end

    def items_changed_signal
      ItemsChangedSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractListModel < GObject::Object
    include ListModel

    GICrystal.define_new_method(Gio::AbstractListModel, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_list_model_get_type
    end

    # Cast a `GObject::Object` to `ListModel`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to ListModel")
    end

    # Cast a `GObject::Object` to `ListModel`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end

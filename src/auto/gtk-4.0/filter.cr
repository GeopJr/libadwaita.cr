require "../g_object-2.0/object"

module Gtk
  # A `GtkFilter` object describes the filtering to be performed by a
  # `Gtk#FilterListModel`.
  #
  # The model will use the filter to determine if it should include items
  # or not by calling `Gtk::Filter#match` for each item and only
  # keeping the ones that the function returns %TRUE for.
  #
  # Filters may change what items they match through their lifetime. In that
  # case, they will emit the `Gtk::Filter::#changed` signal to notify
  # that previous filter results are no longer valid and that items should
  # be checked again via `Gtk::Filter#match`.
  #
  # GTK provides various pre-made filter implementations for common filtering
  # operations. These filters often include properties that can be linked to
  # various widgets to easily allow searches.
  #
  # However, in particular for large lists or complex search methods, it is
  # also possible to subclass `GtkFilter` and provide one's own filter.
  @[GObject::GeneratedWrapper]
  class Filter < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::FilterClass), class_init,
        sizeof(LibGtk::Filter), instance_init, 0)
    end

    GICrystal.define_new_method(Filter, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Filter`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_filter_get_type
    end

    # Notifies all users of the filter that it has changed.
    #
    # This emits the `Gtk::Filter::#changed` signal. Users
    # of the filter should then check items again via
    # `Gtk::Filter#match`.
    #
    # Depending on the @change parameter, not all items need to
    # be changed, but only some. Refer to the `Gtk#FilterChange`
    # documentation for details.
    #
    # This function is intended for implementors of `GtkFilter`
    # subclasses and should not be called from other functions.
    def changed(change : Gtk::FilterChange) : Nil
      # gtk_filter_changed: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_filter_changed(@pointer, change)

      # Return value handling
    end

    # Gets the known strictness of @filters.
    #
    # If the strictness is not known, %GTK_FILTER_MATCH_SOME is returned.
    #
    # This value may change after emission of the `Gtk::Filter::#changed`
    # signal.
    #
    # This function is meant purely for optimization purposes, filters can
    # choose to omit implementing it, but `GtkFilterListModel` uses it.
    def strictness : Gtk::FilterMatch
      # gtk_filter_get_strictness: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_filter_get_strictness(@pointer)

      # Return value handling

      Gtk::FilterMatch.new(_retval)
    end

    # Checks if the given @item is matched by the filter or not.
    def match(item : GObject::Object) : Bool
      # gtk_filter_match: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_filter_match(@pointer, item)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emitted whenever the filter changed.
    #
    # Users of the filter should then check items again via
    # `Gtk::Filter#match`.
    #
    # `GtkFilterListModel` handles this signal automatically.
    #
    # Depending on the @change parameter, not all items need
    # to be checked, but only some. Refer to the `Gtk#FilterChange`
    # documentation for details.
    struct ChangedSignal < GObject::Signal
      def name : String
        @detail ? "changed::#{@detail}" : "changed"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::FilterChange, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::FilterChange, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_change : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          change = Gtk::FilterChange.new(lib_change)
          ::Box(Proc(Gtk::FilterChange, Nil)).unbox(_lib_box).call(change)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Filter, Gtk::FilterChange, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_change : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::Filter.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          change = Gtk::FilterChange.new(lib_change)
          ::Box(Proc(Gtk::Filter, Gtk::FilterChange, Nil)).unbox(_lib_box).call(_sender, change)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(change : Gtk::FilterChange) : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed", change)
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end
  end
end

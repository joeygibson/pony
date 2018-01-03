void do_callback(void (*func)(void* this, char* s), void* this) {
    func(this, "hello world");
}

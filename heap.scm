(define N (read))
(define data (make-vector N))
(define (load n)
        (if (< n N)
                (begin (let ((x (read))) (vector-set! data n x) (load (+ n 1))))))
(load 0)
(define (swap i j)
        (let ((x (vector-ref data i)) (y (vector-ref data j)))
                (begin (vector-set! data i y) (vector-set! data j x))))
(define (insert x n)
    (let* ((m (quotient (- n 1) 2)) (y (vector-ref data m)))
            (if (> x y)
                    (begin (swap n m) (insert x m)))))
(define (upheap n m)
        (if (<= n m)
                (begin (let ((x (vector-ref data n))) (insert x n)) (upheap (+ n 1) m))))
(define (downheap n m)
    (let ((i (* n 2)))
            (if (<= i m)
                (let ((r (vector-ref data n)) (l1 (vector-ref data i)) (l2 (vector-ref data (+ i 1))))
                (cond
                    ((< l1 l2) (if (< l2 r) (begin (swap n (+ i 1)) (downheap (+ i 1) m))))
                    (else (if (< l1 r) (begin (swap n i) (downheap i m))))))
(define (deletemax n)
        (begin (make-heap 0 n) (swap 0 n)))
(define (heapsort)
        (define (f m)
            (if (< m 0)
                (display data)
                (begin (deletemax m) (f (- m 1))))) (f (- N 1)))
(time (heapsort))
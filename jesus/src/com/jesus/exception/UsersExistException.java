package exception;

/**
 * 
 * @author xin
 *
 */
public class UsersExistException extends Exception {
    public UsersExistException() {
        super();
    }

    public UsersExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public UsersExistException(String message) {
        super(message);
    }

    public UsersExistException(Throwable cause) {
        super(cause);
    }

}
